# Documentation: global-settings Terraform/OpenTofu Code

## 1. Overview

This Terraform/OpenTofu code manages Azure subscription-level governance and access control resources. The infrastructure was automatically generated from discovered cloud resources and fully imported into Terraform state using the `imports.sh` script. The final reconciliation showed **0 changes** — all configuration matches the live infrastructure precisely.

**Key infrastructure managed:**
- One Azure Security Center default policy assignment (ASC Default) on the subscription
- One role assignment granting a User principal the Contributor role at the subscription scope

Both resources are now managed as Terraform code; any future changes must be made through this code and applied to maintain consistency.

---

## 2. Resources

| Terraform Address | Type | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.policy_assignment["asc_default"].azurerm_subscription_policy_assignment.this` | `azurerm_subscription_policy_assignment` | `SecurityCenterBuiltIn` | Default Azure Security Center policy assignment auditing compliance at subscription level |
| `module.role_assignment["672a8b9c"].azurerm_role_assignment.this` | `azurerm_role_assignment` | `672a8b9c-068d-48b6-8528-8df74234e662` | Contributor role assignment to user principal `491f87f3-3dfc-41e0-bd93-df088ede8f8b` at subscription scope |

---

## 3. Module Structure

This root module uses two local child modules defined in the `modules/` directory:

### Module: `modules/policy_assignment`

**Purpose:** Abstracts the creation of Azure subscription-level policy assignments.

**Resources:**
- `azurerm_subscription_policy_assignment.this` — the policy assignment resource

**Input Variables:**
- `name` (required, string) — Name of the policy assignment
- `subscription_id` (required, string) — Subscription ID where policy applies
- `policy_definition_id` (required, string) — Policy set or policy definition resource ID
- `description` (optional, string) — Human-readable description
- `display_name` (optional, string) — Display name shown in Azure portal
- `enforce` (optional, bool, default=true) — Enforcement mode; true=Enforce, false=DoNotEnforce
- `not_scopes` (optional, list of strings) — Exempted resource scopes
- `parameters` (optional, string) — JSON string of policy parameters

**Output Variables:**
- `id` — The ID of the policy assignment

**Root call style:** `for_each` over map `var.policy_assignments` with key `"asc_default"`

### Module: `modules/role_assignment`

**Purpose:** Abstracts the creation of Azure role assignments at any scope (subscription, resource group, etc.).

**Resources:**
- `azurerm_role_assignment.this` — the role assignment resource

**Input Variables:**
- `scope` (required, string) — Scope path (e.g., `/subscriptions/{id}`, resource group ID, etc.)
- `role_definition_id` (required, string) — Full resource ID of the role definition
- `principal_id` (required, string) — Object ID of the principal (user, group, or service principal)
- `principal_type` (optional, string) — Type of principal: `User`, `Group`, or `ServicePrincipal`
- `name` (optional, string) — Unique GUID for the assignment (typically auto-generated)

**Output Variables:**
- `id` — The ID of the role assignment

**Root call style:** `for_each` over map `var.role_assignments` with key `"672a8b9c"`

### Root Module

**File structure:**
- `main.tf` — Instantiates `policy_assignment` and `role_assignment` modules via `for_each`
- `variables.tf` — Defines root input variables `subscription_id`, `policy_assignments`, `role_assignments`
- `providers.tf` — Configures the `azurerm` provider (v3.0+) with subscription ID and `skip_provider_registration = true`
- `versions.tf` — Declares required provider versions
- `outputs.tf` — No root-level outputs (module outputs available via `module.<name>[<key>].id`)

---

## 4. How Import Works

The `imports.sh` script imports live cloud resources into Terraform state. It was executed once during initial setup to populate the state file.

### Import Commands Used

Two resources were imported:

```bash
terraform import -var-file environments/sg.tfvars \
  'module.policy_assignment["asc_default"].azurerm_subscription_policy_assignment.this' \
  '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn'

terraform import -var-file environments/sg.tfvars \
  'module.role_assignment["672a8b9c"].azurerm_role_assignment.this' \
  '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleAssignments/672a8b9c-068d-48b6-8528-8df74234e662'
```

### Re-importing a Single Resource

If state is corrupted or lost for one resource, re-import it using:

```bash
terraform import -var-file environments/sg.tfvars \
  'module.policy_assignment["asc_default"].azurerm_subscription_policy_assignment.this' \
  '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn'
```

Replace the resource address and import ID as needed. The `-var-file` flag must be included to supply variable values (especially `subscription_id` and policy/role details).

---

## 5. How to Use the Code

### Prerequisites

1. **Terraform/OpenTofu:** Ensure the binary is available (path: `/tmp/tmp.pkbnAB/terraform`)
2. **Azure credentials:** Logged in via `az login` or with `ARM_*` environment variables set
3. **Subscription access:** Must have sufficient permissions (Owner or User Access Administrator recommended for role assignments)

### Initialize

```bash
cd /mnt/sg_workspace/user/global-settings
terraform init
```

This downloads provider plugins (azurerm ~3.0) and initializes the state backend.

### Plan

```bash
terraform plan -var-file environments/sg.tfvars
```

This compares configuration against live state. **Expected output:** `No changes. Your infrastructure matches the configuration.` (0 additions, 0 changes, 0 destructions).

### Apply

```bash
terraform apply -var-file environments/sg.tfvars
```

No changes will be applied unless configuration has been edited. When modifying policy or role assignments (see below), `apply` will create, update, or destroy resources as planned.

### Targeting Another Environment

To manage a different subscription or override values:

1. Copy and modify the variables file:
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   # Edit environments/prod.tfvars with new subscription_id, policies, roles, etc.
   ```

2. Plan and apply with the new file:
   ```bash
   terraform plan -var-file environments/prod.tfvars
   terraform apply -var-file environments/prod.tfvars
   ```

**Note:** No `.tf` code edits are required; all configuration lives in `.tfvars` files.

### Modifying Policy or Role Assignments

Edit `environments/sg.tfvars` (or another `.tfvars` file) to:
- **Add** a new assignment: Insert a new map entry under `policy_assignments` or `role_assignments`
- **Update** an existing assignment: Change field values in the map entry
- **Remove** an assignment: Delete the map entry (or set the entire map to `{}`)

Then run `terraform plan` and `terraform apply` to apply changes.

---

## 6. Variables

### Root Variables

| Variable | Type | Default | Description | Sensitive? |
|---|---|---|---|---|
| `subscription_id` | string | `"618c8e34-b87b-44e8-bb3a-b2de95df60ed"` | Azure Subscription ID for this deployment | No |
| `policy_assignments` | map of objects | `{}` | Map of policy assignments keyed by logical name (e.g., `"asc_default"`) | No |
| `role_assignments` | map of objects | `{}` | Map of role assignments keyed by logical name or ID (e.g., `"672a8b9c"`) | No |

### Policy Assignment Object Schema

Each entry in `var.policy_assignments` is a map object with:

| Field | Type | Default | Required? | Notes |
|---|---|---|---|---|
| `name` | string | — | Yes | Internal name of the assignment (e.g., `"SecurityCenterBuiltIn"`) |
| `subscription_id` | string | — | Yes | Full Azure resource path (e.g., `/subscriptions/...`) |
| `policy_definition_id` | string | — | Yes | Policy or policy set definition resource ID (e.g., `/providers/Microsoft.Authorization/policySetDefinitions/...`) |
| `description` | string | `""` | No | Descriptive text |
| `display_name` | string | `""` | No | Name shown in Azure portal |
| `enforce` | bool | `true` | No | If `true`, enforce; if `false`, audit-only (DoNotEnforce) |
| `not_scopes` | list(string) | `[]` | No | Resource scopes exempt from the policy |
| `parameters` | string | `null` | No | JSON string of policy parameters; must be `"{}"` if live state has empty object (see caveats) |

### Role Assignment Object Schema

Each entry in `var.role_assignments` is a map object with:

| Field | Type | Default | Required? | Notes |
|---|---|---|---|---|
| `scope` | string | — | Yes | Azure resource scope (e.g., `/subscriptions/{id}`) |
| `role_definition_id` | string | — | Yes | Full role definition resource ID (e.g., `/subscriptions/.../roleDefinitions/...`) |
| `principal_id` | string | — | Yes | Object ID of user, group, or service principal |
| `principal_type` | string | `null` | No | `"User"`, `"Group"`, or `"ServicePrincipal"` |
| `name` | string | `null` | No | Assignment GUID (usually auto-generated; optional if not required by API) |

### Sensitive Variables

**None of the variables in this configuration are marked `sensitive`.** All values (subscription IDs, definition IDs, principal IDs) are identifiers, not credentials. The azurerm provider authenticates via Azure CLI or environment variables, not through Terraform variables.

If in the future a `secrets.auto.tfvars` file existed, it is **not included** in the repository for security. If you find references to such variables in code, you must:

1. Create `secrets.auto.tfvars` in the root module directory
2. Populate it with the required sensitive values (e.g., client secrets, API keys)
3. **Never commit it to version control**

To plan/apply without a `secrets.auto.tfvars` file, pass values via `-var`:
```bash
terraform plan -var-file environments/sg.tfvars -var "some_var=value"
```

---

## 7. Infrastructure Graph

```
Root Module
├── module.policy_assignment["asc_default"]
│   └── azurerm_subscription_policy_assignment.this
│       └── (references)
│           └── Policy Definition: /providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8
│
└── module.role_assignment["672a8b9c"]
    └── azurerm_role_assignment.this
        └── (references)
            └── Role Definition: /subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c
```

**Dependency notes:**
- Policy assignment depends only on the subscription ID; the policy definition is referenced by ID but not managed by this code (it is a built-in Azure policy).
- Role assignment depends only on the scope, role definition ID, and principal ID; none of these are managed by this code (they are references to existing Azure resources).
- No inter-resource dependencies exist within this stack.

---

## 8. Notable Decisions & Caveats

### Azure Resource Manager Provider Version

**Decision:** Used `azurerm >= 3.0` (specified in `versions.tf`).

**Reason:** `azurerm_subscription_policy_assignment` was added in azurerm v3 to replace the deprecated `azurerm_policy_assignment` resource. The older resource does not support subscription-scope policies. Using v3 ensures compatibility with modern Azure governance.

### Provider: `skip_provider_registration = true`

**Decision:** Set `skip_provider_registration = true` in `providers.tf`.

**Reason:** The connector identity lacks `*/register/action` permission on many Azure resource providers. Skipping registration prevents permission errors during `terraform init` and operations. The necessary providers are already registered on the subscription.

### Policy Assignment Parameters

**Decision:** Explicitly set `parameters = "{}"` in `environments/sg.tfvars`.

**Reason:** Azure stores an empty JSON object (`{}`) in live state when no parameters are defined. If omitted from the Terraform configuration, Terraform would detect a drift (state has `{}`, config has `null`) and attempt to update the resource on every `plan` run. Explicitly setting `parameters = "{}"` prevents this spurious drift.

### Enforce Flag Mapping

**Decision:** The `enforce` variable is a boolean; `true` means "enforce," and `false` means "don't enforce" (audit-only).

**Reason:** Azure discovery data returns `enforcement_mode = "Default"` (enforce) or `"DoNotEnforce"`. The azurerm provider represents this as a boolean `enforce` attribute: `true` = Default (enforce), `false` = DoNotEnforce. The variable description in code clarifies this mapping.

### No `lifecycle { ignore_changes }` Blocks

**Decision:** No `lifecycle` blocks were added to either resource.

**Reason:** None were necessary:
- Policy assignment metadata (e.g., `createdBy`, `updatedOn`) are read-only, computed attributes and are not in the resource schema as configurable fields.
- Role assignment has no known computed attributes that require exclusion.
- Configuration is stable and matches the live resource state exactly.

### No Write-Only Attributes

**Decision:** No attributes were routed to a separate `secrets.auto.tfvars` file.

**Reason:** All configuration values (subscription IDs, definition IDs, principal IDs) are non-sensitive identifiers. Azure authentication is handled by the provider block (via Azure CLI or environment variables), not through Terraform variables.

### Module Iteration via `for_each`

**Decision:** Both modules are instantiated with `for_each` over maps in `variables.tf`, not `count`.

**Reason:** `for_each` provides stable resource addresses keyed by logical names (e.g., `"asc_default"`) rather than numeric indices, making configuration more readable and reducing churn if items are added/removed in different orders.

### No Root-Level Outputs

**Decision:** `outputs.tf` contains only a comment; module outputs are not re-exported.

**Reason:** The infrastructure is subscription-level governance configuration. Downstream modules or root composition typically do not depend on the IDs of policy or role assignments; they reference the policies and roles themselves. If outputs are needed, they can be added to the root module by referencing `module.policy_assignment[*].id` or `module.role_assignment[*].id` as required.

### Remaining Drift

**Status:** None. The `terraform plan` command confirmed: **0 to add, 0 to change, 0 to destroy.**

All imported resources are fully reconciled with the configuration. No computed attributes, stale state, or omitted fields remain.

---

## Appendix: File Structure

```
/mnt/sg_workspace/user/global-settings/
├── main.tf                              # Root module: policy_assignment and role_assignment module calls
├── variables.tf                         # Root variables: subscription_id, policy_assignments, role_assignments
├── providers.tf                         # Provider config for azurerm
├── versions.tf                          # Required provider versions
├── outputs.tf                           # No root outputs
├── environments/
│   └── sg.tfvars                        # Variable file: subscription ID, policy, and role assignments
├── modules/
│   ├── policy_assignment/
│   │   ├── main.tf                      # azurerm_subscription_policy_assignment.this resource
│   │   ├── variables.tf                 # Module input variables
│   │   └── outputs.tf                   # id output
│   └── role_assignment/
│       ├── main.tf                      # azurerm_role_assignment.this resource
│       ├── variables.tf                 # Module input variables
│       └── outputs.tf                   # id output
├── imports.sh                           # Import script: terraform import commands for both resources
└── .sg/
    ├── handoff.md                       # Design decisions and import ID reference
    └── DOCUMENTATION.md                 # This file
```

---

**Generated:** 2026-09-03  
**IaC Tool:** Terraform/OpenTofu  
**Provider:** HashiCorp azurerm v3.x  
**Status:** Reconciled (0/0/0 changes)
