# Global Settings — Infrastructure Documentation

**Last Updated:** 2026-10-13  
**Reconciliation Status:** ✅ All resources imported and verified — `plan` shows 0/0/0 (no changes)

---

## 1. Overview

This infrastructure-as-code (IaC) project manages two custom Azure role definitions in a single subscription. The code was generated from cloud resource discovery, imported into Terraform state via `imports.sh`, and reconciled until the plan showed no outstanding changes.

### What This Manages
- **Azure Kubernetes Fleet Manager RBAC Cluster Writer** — A custom role enabling read/write access to Kubernetes cluster-scoped resources in Azure Container Fleets, with 61 Kubernetes data actions
- **Azure Local Migrate Execute Expert** — A custom role for restricted migration operations on Azure Local environments, including replication, execution, and agentless migration initiation

### Workflow
1. Cloud resources were discovered via cloud scanning
2. A module (`role_definition`) was generated to encapsulate the Azure role definition resource
3. `imports.sh` was run to import both role definitions into Terraform state using their full resource paths and subscription scope
4. The configuration was iteratively adjusted to match the live cloud state exactly, including the addition of `data_actions` discovered after initial import
5. Final state: no changes pending

---

## 2. Resources

| Terraform Address | Provider | Real-World Name | ID | Purpose |
|---|---|---|---|---|
| `module.role_definition["azure_kubernetes_fleet_manager_rbac_cluster_writer"].azurerm_role_definition.this` | azurerm | Azure Kubernetes Fleet Manager RBAC Cluster Writer | `1dc4cd5a-de51-4ee4-bc8e-b40e9c17e320` | Custom role for K8s fleet operations with 2 control-plane actions and 61 data actions on fleets, apps, networking, storage, scheduling, and policies |
| `module.role_definition["azure_local_migrate_execute_expert"].azurerm_role_definition.this` | azurerm | Azure Local Migrate Execute Expert | `1cfa4eac-9a23-481c-a793-bfb6958e836c` | Custom role for Azure Local and Azure Stack HCI migrations with broad resource, deployment, storage, and replication permissions across two permission blocks |

---

## 3. Module Structure

### `modules/role_definition/`

**Path:** `./modules/role_definition/`

**Local module** (source: `./modules/role_definition`) — encapsulates Azure role definition creation.

#### Inputs
- `role_name` (string, required): The display name of the role (e.g., "Azure Kubernetes Fleet Manager RBAC Cluster Writer")
- `scope` (string, required): The scope at which the role definition applies (typically subscription scope: `/subscriptions/<uuid>`)
- `description` (string, optional): A human-readable description of the role's purpose
- `assignable_scopes` (list(string), optional, default `["/"]`): List of scopes where this role can be assigned (typically root `/` for Azure built-in roles)
- `permissions` (list(object), optional, default `[]`): Dynamic permission blocks, each containing:
  - `actions` (list(string), default `[]`) — control-plane resource actions (e.g., `Microsoft.ContainerService/fleets/read`)
  - `not_actions` (list(string), default `[]`) — explicitly denied actions
  - `data_actions` (list(string), default `[]`) — Kubernetes data-plane actions (e.g., `Microsoft.ContainerService/fleets/apps/deployments/read`)
  - `not_data_actions` (list(string), default `[]`) — explicitly denied data actions

#### Outputs
- `id` — the full resource ID of the created role definition
- `role_definition_id` — the UUID-only portion of the role definition

#### Resource
- `azurerm_role_definition.this` — the managed role definition resource

---

## 4. How Import Works

### Import Mechanism

The `imports.sh` script imports each role definition into Terraform state using the Azure resource manager's full path plus subscription scope format.

**Import ID Format (Azure RM v3):**
```
<full_resource_path>|<scope>
```

Example:
```
/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleDefinitions/1dc4cd5a-de51-4ee4-bc8e-b40e9c17e320|/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed
```

### How It Was Run (Already Complete)

```bash
./imports.sh /tmp/tmp.KndjId/tofu
```

This executed two import statements via `tofu import`:
- `module.role_definition["azure_kubernetes_fleet_manager_rbac_cluster_writer"].azurerm_role_definition.this`
- `module.role_definition["azure_local_migrate_execute_expert"].azurerm_role_definition.this`

**Note:** The simple UUID from discovery data (e.g., `1dc4cd5a-de51-4ee4-bc8e-b40e9c17e320`) is NOT a valid import ID on its own; the full resource path and scope are required.

### Re-importing a Single Resource (If State Lost)

To re-import a single resource manually:

```bash
cd /mnt/sg_workspace/user/global-settings

# Kubernetes Fleet role
tofu import -var-file environments/sg.tfvars \
  'module.role_definition["azure_kubernetes_fleet_manager_rbac_cluster_writer"].azurerm_role_definition.this' \
  '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleDefinitions/1dc4cd5a-de51-4ee4-bc8e-b40e9c17e320|/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed'

# Migrate Execute Expert role
tofu import -var-file environments/sg.tfvars \
  'module.role_definition["azure_local_migrate_execute_expert"].azurerm_role_definition.this' \
  '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleDefinitions/1cfa4eac-9a23-481c-a793-bfb6958e836c|/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed'
```

---

## 5. How to Use the Code

### Prerequisites
- OpenTofu/Terraform CLI installed (this project uses `/tmp/tmp.KndjId/tofu`)
- Azure CLI authenticated with credentials for the target subscription (`618c8e34-b87b-44e8-bb3a-b2de95df60ed`)
- Service principal must have `skip_provider_registration = true` enabled (lacks `*/register/action` on providers)

### Initialize Terraform

```bash
cd /mnt/sg_workspace/user/global-settings
/tmp/tmp.KndjId/tofu init
```

This downloads the azurerm provider (~> 3.0) and initializes the backend.

### Plan Changes

```bash
/tmp/tmp.KndjId/tofu plan -var-file=environments/sg.tfvars
```

Expected output for current state: `No changes. Your infrastructure matches the configuration.`

### Apply Changes

```bash
/tmp/tmp.KndjId/tofu apply -var-file=environments/sg.tfvars
```

Confirm with `yes` at the prompt. Since the state is already reconciled, no changes will be applied.

### Targeting Another Environment

To deploy to a different Azure subscription or with modified role definitions:

1. **Copy the variables file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** with production values:
   ```hcl
   subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  # Different subscription
   
   role_definitions = {
     # Modify role definitions as needed — same structure
   }
   ```

3. **Plan with the new file:**
   ```bash
   /tmp/tmp.KndjId/tofu plan -var-file=environments/prod.tfvars
   ```

4. **Apply to the new environment:**
   ```bash
   /tmp/tmp.KndjId/tofu apply -var-file=environments/prod.tfvars
   ```

**No `.tf` file modifications are needed** — all configuration is in `environments/*.tfvars`.

---

## 6. Variables

### Root Variables

#### `subscription_id` (string, required)
- **Description:** Azure subscription ID where role definitions are managed
- **Example:** `"618c8e34-b87b-44e8-bb3a-b2de95df60ed"`
- **Sensitive:** No
- **Source:** `environments/sg.tfvars`

#### `role_definitions` (map(object), optional)
- **Description:** Map of Azure role definitions to manage, keyed by a unique identifier (e.g., `"azure_kubernetes_fleet_manager_rbac_cluster_writer"`)
- **Type Structure:**
  ```hcl
  map(object({
    role_name          = string              # Name of the role (required)
    scope              = optional(string)    # Scope where role applies (default: "")
    description        = optional(string)    # Role description (default: "")
    assignable_scopes  = optional(list(string))  # Where role can be assigned (default: ["/"])
    permissions = optional(list(object({
      actions          = optional(list(string))  # Allowed actions (default: [])
      not_actions      = optional(list(string))  # Denied actions (default: [])
      data_actions     = optional(list(string))  # Allowed data actions (default: [])
      not_data_actions = optional(list(string))  # Denied data actions (default: [])
    })))
  }))
  ```
- **Default:** `{}` (empty map)
- **Sensitive:** No
- **Example:** See `environments/sg.tfvars` for the two role definitions

### No Sensitive Variables

**Important:** No sensitive input variables are used in this configuration. No `secrets.auto.tfvars` file is required or distributed. All configuration values (subscription IDs, role names, permissions) are non-sensitive and stored in `environments/sg.tfvars`.

If a future requirement introduces sensitive data (e.g., credentials), create a `secrets.auto.tfvars` file locally and add it to `.gitignore`.

---

## 7. Infrastructure Graph

```
module.role_definition (for_each loop over var.role_definitions)
│
├── "azure_kubernetes_fleet_manager_rbac_cluster_writer"
│   └── azurerm_role_definition.this
│       ID: 1dc4cd5a-de51-4ee4-bc8e-b40e9c17e320
│       name: "Azure Kubernetes Fleet Manager RBAC Cluster Writer"
│       scope: /subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed
│       permissions: 1 block (2 actions, 61 data actions)
│       assignable_scopes: ["/"]
│
└── "azure_local_migrate_execute_expert"
    └── azurerm_role_definition.this
        ID: 1cfa4eac-9a23-481c-a793-bfb6958e836c
        name: "Azure Local Migrate Execute Expert"
        scope: /subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed
        permissions: 2 blocks (39 actions + exclusions, 2 actions)
        assignable_scopes: ["/"]

Dependencies:
- No inter-resource dependencies (roles are independent)
- Each role depends on provider configuration and subscription_id variable
```

---

## 8. Notable Decisions & Caveats

### 1. Discovery Data vs. Live State Reconciliation

**Decision:** Added `data_actions` to match live cloud state.

**Rationale:** The initial discovery data only listed 2 control-plane `actions` for the Kubernetes Fleet Manager role (e.g., `Microsoft.ContainerService/fleets/read`). When importing and planning, we discovered that the live cloud state contained 61 additional `data_actions` representing Kubernetes resource operations (deployments, statefulsets, services, configmaps, etc.). These were added to the module variables and `environments/sg.tfvars` to ensure `terraform plan` showed no drift.

### 2. Scope Configuration

**Decision:** `scope` must be set to the subscription scope, not bare `/`.

**Rationale:** Azure's role definition API requires the `scope` to be a fully qualified path (e.g., `/subscriptions/<uuid>`). A bare `/` is invalid for the `scope` attribute; only `assignable_scopes` accepts `/` to indicate the role is globally assignable. This was discovered during import and corrected in the generated code.

### 3. Provider Registration Bypass

**Decision:** `skip_provider_registration = true` in `providers.tf`.

**Rationale:** The service principal used to run this code lacks `Microsoft.Authorization/*/register/action` permissions on resource providers. Skipping provider registration allows the code to run with least-privilege credentials. The providers are pre-registered in the subscription by Azure; registration is not required for read/write operations on role definitions.

### 4. Role Type: BuiltInRole

**Discovery:** Both roles are marked as `BuiltInRole` type in the cloud.

**Implication:** Terraform manages these declaratively without attempting to mutate the `type` field (which is read-only). The roles are treated as custom role definitions scoped to the subscription, but their `type` attribute cannot be changed by IaC. If the cloud ever marks them differently, the state will drift (but no `apply` will succeed in changing it).

### 5. No Computed Attributes in Output

**Decision:** Outputs extract only `id` and `role_definition_id`.

**Rationale:** Most attributes of `azurerm_role_definition` are input-driven (no computed fields beyond the resource IDs). Outputs are minimal and serve only as references for downstream modules or manual lookups.

### 6. for_each Keying Strategy

**Decision:** Module instances use descriptive keys (e.g., `"azure_kubernetes_fleet_manager_rbac_cluster_writer"`) rather than numeric indices.

**Rationale:** This provides stable, readable addresses and avoids index-based fragility when roles are added/removed. The key names are derived from the role names but made Terraform-safe (lowercase, underscores).

### 7. Two Permission Blocks for Migrate Expert Role

**Structure:** The Azure Local Migrate Execute Expert role contains two separate `permissions` blocks in the tfvars:
- **Block 1:** 39 actions across resources, deployments, storage, migration, and replication services; 6 explicit `not_actions` for OffAzure inventory insights
- **Block 2:** 2 actions for role assignment write/delete

**Reason:** This dual-block structure reflects how Azure's role definition API organizes permissions. The module's dynamic block handles both correctly.

### 8. No Drift Management with `lifecycle` Rules

**Decision:** No `lifecycle { ignore_changes }` rules were added.

**Rationale:** The role definitions are fully declarative and intended to be managed via code. If drift is observed (e.g., manual console changes to permissions), it will be detected and can be resolved by reapplying the configuration. Since these are built-in-styled roles (not truly immutable), declarative management is appropriate.

