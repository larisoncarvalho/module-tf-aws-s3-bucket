# Terraform Documentation: Global Settings

## 1. Overview

This Terraform codebase manages Azure IAM role assignments at the subscription scope. The infrastructure was generated from discovered cloud resources, imported into state via `imports.sh`, and reconciled until `terraform plan` showed 0 changes (0 to add, 0 to change, 0 to destroy).

**Current state:** One Azure role assignment for a User principal on a subscription scope.

---

## 2. Resources

| Terraform Address | Provider Type | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.role_assignment["cc5164f7_d0bc_4f5f_9d12_93baeb747642"].azurerm_role_assignment.this` | `azurerm_role_assignment` | `cc5164f7-d0bc-4f5f-9d12-93baeb747642` | Assigns the Contributor role (`b24988ac-6180-42a0-ab88-20f7382dd24c`) to a User principal (`35fb9e75-c3df-40fb-ba82-889faf409804`) at subscription scope (`/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed`). |

---

## 3. Module Structure

### Root Module (`./`)

- **Files:**
  - `main.tf` — Defines the root `module.role_assignment` using `for_each` over `var.role_assignments`
  - `variables.tf` — Declares input variable `role_assignments` (map of objects)
  - `outputs.tf` — No root-level outputs (to avoid stale-null issues with `for_each`)
  - `versions.tf` — Specifies Terraform version and required providers (azurerm ~> 3.0)
  - `providers.tf` — Configures the Azure provider with `skip_provider_registration = true`

### Module: `modules/role_assignment/`

- **Purpose:** Wraps `azurerm_role_assignment` resource to manage a single role assignment.
- **Files:**
  - `main.tf` — Defines `azurerm_role_assignment.this`
  - `variables.tf` — Module input variables:
    - `scope` (required): The scope at which the role assignment applies
    - `role_definition_id` (required): Fully-qualified role definition ID
    - `principal_id` (required): ID of the principal to assign the role to
    - `principal_type` (optional): Type of principal (User, Group, or ServicePrincipal)
    - `name` (optional): The name (GUID) of the role assignment
  - `outputs.tf` — Exports:
    - `id`: The ID of the role assignment
    - `principal_id`: The principal ID of the role assignment

### Root Module Call Style

The root module uses `for_each` to iterate over `var.role_assignments`. Each key in the map becomes a module instance identifier (e.g., `"cc5164f7_d0bc_4f5f_9d12_93baeb747642"`), and the value object provides the module inputs.

---

## 4. How Import Works

### One-Time Import

The `imports.sh` script was executed once to populate Terraform state from discovered Azure resources:

```bash
# Location of terraform binary passed as first argument ($1)
/tmp/tmp.haBiAm/terraform import -var-file environments/sg.tfvars \
  'module.role_assignment["cc5164f7_d0bc_4f5f_9d12_93baeb747642"].azurerm_role_assignment.this' \
  '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleAssignments/cc5164f7-d0bc-4f5f-9d12-93baeb747642'
```

**Key points:**
- The import ID is the full Azure resource path for the role assignment.
- The `-var-file environments/sg.tfvars` ensures the module `for_each` map is populated before import.
- This script does **not** need to be re-run unless state is lost or new resources are discovered.

### Re-Importing a Single Resource

If state is lost or needs to be rebuilt, re-import the resource:

```bash
terraform import -var-file environments/sg.tfvars \
  'module.role_assignment["cc5164f7_d0bc_4f5f_9d12_93baeb747642"].azurerm_role_assignment.this' \
  '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleAssignments/cc5164f7-d0bc-4f5f-9d12-93baeb747642'
```

The map key in `environments/sg.tfvars` must match the module instance address.

---

## 5. How to Use the Code

### Initialize Terraform

```bash
terraform init
```

This downloads the Azure provider and initializes the state backend.

### Plan Changes

```bash
terraform plan -var-file=environments/sg.tfvars
```

This shows any differences between the current state and the desired configuration. After initial import and reconciliation, this should show **0 to add, 0 to change, 0 to destroy**.

### Apply Changes

```bash
terraform apply -var-file=environments/sg.tfvars
```

This applies any changes to Azure. Since the infrastructure is already reconciled, no changes will be made.

### Target Another Environment

To manage role assignments for a different environment (e.g., dev → prod):

1. **Copy** `environments/sg.tfvars` to a new file (e.g., `environments/prod.tfvars`):
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit** `environments/prod.tfvars` to update the role assignment values (scope, principal IDs, etc.):
   ```hcl
   role_assignments = {
     "new_assignment_id" = {
       name               = "new-guid"
       scope              = "/subscriptions/different-subscription-id"
       role_definition_id = "/subscriptions/different-subscription-id/providers/Microsoft.Authorization/roleDefinitions/..."
       principal_id       = "different-principal-id"
       principal_type     = "User"
     }
   }
   ```

3. **Plan** with the new variables file:
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   ```

4. **Apply** the new configuration:
   ```bash
   terraform apply -var-file=environments/prod.tfvars
   ```

**No `.tf` files need to be edited** — all environment-specific values are in the `.tfvars` file.

---

## 6. Variables

### Root Variable: `role_assignments`

- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Description:** Map of Azure role assignments to manage
- **Schema:**
  ```hcl
  map(object({
    scope              = string                   # Required
    role_definition_id = string                   # Required
    principal_id       = string                   # Required
    principal_type     = optional(string, null)   # Optional
    name               = optional(string, null)   # Optional
  }))
  ```

**Current values** (from `environments/sg.tfvars`):
- **Map key:** `"cc5164f7_d0bc_4f5f_9d12_93baeb747642"` (sanitized from the role assignment GUID)
- **scope:** `/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed`
- **role_definition_id:** `/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c` (Contributor role)
- **principal_id:** `35fb9e75-c3df-40fb-ba82-889faf409804` (User principal)
- **principal_type:** `"User"`
- **name:** `"cc5164f7-d0bc-4f5f-9d12-93baeb747642"` (role assignment GUID)

### No Sensitive Variables

This codebase has **no sensitive variables** — all input variables are declared explicitly in `environments/sg.tfvars` with real values. There is no `secrets.auto.tfvars` file.

---

## 7. Infrastructure Graph

```
root
└── module.role_assignment["cc5164f7_d0bc_4f5f_9d12_93baeb747642"]
    └── azurerm_role_assignment.this
        ├── Scope: /subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed (subscription)
        ├── Role Definition: b24988ac-6180-42a0-ab88-20f7382dd24c (Contributor)
        └── Principal: 35fb9e75-c3df-40fb-ba82-889faf409804 (User)
```

The role assignment is at the subscription scope and assigns the Contributor role to a User principal. There are no child resources or cross-references.

---

## 8. Notable Decisions & Caveats

### Provider Configuration

- **`skip_provider_registration = true`:** The Azure provider is configured to skip provider registration because the service principal lacks permissions to register resource providers. This prevents errors during plan/apply if the Microsoft.Authorization provider is not already registered.

### Role Assignment Name (GUID)

- **Explicit `name` field:** The role assignment's GUID (`cc5164f7-d0bc-4f5f-9d12-93baeb747642`) is set explicitly in both the configuration and the module input. This preserves the existing assignment ID rather than allowing Azure to auto-generate a new one. This is critical for matching the discovered resource during import.

### Principal Type

- **Explicit `principal_type = "User"`:** The principal type is set explicitly to match the discovered resource. This ensures the role assignment is correctly associated with a User principal rather than being inferred.

### No Lifecycle Rules or Computed Attributes

- **No `lifecycle { ignore_changes }`:** The resource has no special lifecycle management rules. All fields are managed by Terraform.
- **No computed attributes:** The role assignment resource has no computed attributes that require special handling. The module outputs only expose the `id` and `principal_id`.

### For-Each Map Key Sanitization

- The map key `"cc5164f7_d0bc_4f5f_9d12_93baeb747642"` replaces hyphens with underscores from the original GUID. This is necessary because HCL map keys cannot contain hyphens directly. The actual role assignment GUID is stored in the `name` field of the configuration.

### No Root Outputs

- The root module has no outputs. Module outputs are not exported to avoid the stale-null trap that occurs with `for_each` when map elements are removed.

### Reconciliation Status

- **Plan result:** 0 to add, 0 to change, 0 to destroy. The infrastructure matches the configuration exactly after one provider fix (`skip_provider_registration`).
