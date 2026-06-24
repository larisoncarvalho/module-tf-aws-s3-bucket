# Global Settings Infrastructure Documentation

## 1. Overview

This Terraform configuration manages AWS cloud resources in the `ap-southeast-1` region. The code was generated from discovered cloud resources and imported into Terraform state until `plan` showed `0/0/0` — meaning the configuration now matches the discovered infrastructure exactly.

**Resources managed:**
- One AWS CloudFormation stack (`stulyze-app`)
- One AWS Athena workgroup (`primary`)

The configuration uses a modular design with two reusable modules: `cloudformation_stack` and `athena_workgroup`. Both modules are instantiated via `for_each` loops using variables defined in `environments/sg.tfvars`, allowing multiple instances of each resource type to be managed independently.

---

## 2. Resources

| Terraform Address | Provider | Type | Real-World Name/ID | Purpose |
|---|---|---|---|---|
| `module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this` | `aws` | `aws_cloudformation_stack` | `arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518` | CloudFormation stack that creates a DynamoDB table (`stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG`) for the Stulyze application |
| `module.athena_workgroup["primary"].aws_athena_workgroup.this` | `aws` | `aws_athena_workgroup` | `primary` | Athena workgroup with CloudWatch metrics publishing enabled for running SQL queries |

---

## 3. Module Structure

### Root Module (`/mnt/sg_workspace/user/global-settings/`)

**Purpose:** Orchestrates two child modules via `for_each` loops. Passes variable objects from `environments/sg.tfvars` to each module instance.

**Configuration files:**
- `main.tf` — Module instantiation with `for_each = var.cloudformation_stacks` and `for_each = var.athena_workgroups`
- `variables.tf` — Top-level input variables (two map-type variables)
- `versions.tf` — Terraform and provider version requirements
- `providers.tf` — AWS provider configuration (region: `ap-southeast-1`)
- `outputs.tf` — (Empty; no root-level scalar outputs needed for `for_each` modules)

### `modules/cloudformation_stack/`

**Purpose:** Reusable module for managing AWS CloudFormation stacks.

**Files:**
- `main.tf` — Declares `aws_cloudformation_stack` resource with properties: `name`, `disable_rollback`, `notification_arns`, `tags`
- `variables.tf` — Input variables:
  - `name` (required, string) — Stack name
  - `disable_rollback` (optional, bool, default: `false`)
  - `notification_arns` (optional, list(string), default: `[]`)
  - `tags` (optional, map(string), default: `{}`)
- `outputs.tf` — Exports:
  - `id` — The stack ARN
  - `name` — The stack name

**Current instance:** `stulyze_app` (map key in `var.cloudformation_stacks`)

### `modules/athena_workgroup/`

**Purpose:** Reusable module for managing AWS Athena workgroups.

**Files:**
- `main.tf` — Declares `aws_athena_workgroup` resource with properties: `name`, `description`, `state`, `tags`, and a nested `configuration` block with `enforce_workgroup_configuration` and `publish_cloudwatch_metrics_enabled`
- `variables.tf` — Input variables:
  - `name` (required, string) — Workgroup name
  - `description` (optional, string, default: `""`)
  - `state` (optional, string, default: `"ENABLED"`)
  - `enforce_workgroup_configuration` (optional, bool, default: `true`)
  - `publish_cloudwatch_metrics_enabled` (optional, bool, default: `true`)
  - `tags` (optional, map(string), default: `{}`)
- `outputs.tf` — Exports:
  - `id` — The workgroup name (used as ID)
  - `name` — The workgroup name

**Current instance:** `primary` (map key in `var.athena_workgroups`)

---

## 4. How Import Works

The `imports.sh` script was used to populate the Terraform state with discovered resources. It contains two `terraform import` commands:

```bash
terraform import -var-file environments/sg.tfvars \
  'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' \
  'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'

terraform import -var-file environments/sg.tfvars \
  'module.athena_workgroup["primary"].aws_athena_workgroup.this' \
  'primary'
```

**How it works:**
1. Each command maps a Terraform address (left argument) to a cloud resource ID (right argument)
2. The `-var-file` option ensures variable values are available during import (required for `for_each` module instantiation)
3. The script was run once after initial code generation to populate state

**To re-import a single resource if state is lost:**

For the CloudFormation stack:
```bash
/tmp/tmp.lkAOdl/terraform import -var-file environments/sg.tfvars \
  'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' \
  'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
```

For the Athena workgroup:
```bash
/tmp/tmp.lkAOdl/terraform import -var-file environments/sg.tfvars \
  'module.athena_workgroup["primary"].aws_athena_workgroup.this' \
  'primary'
```

---

## 5. How to Use the Code

### Prerequisites

- Terraform/OpenTofu binary installed (path: `/tmp/tmp.lkAOdl/terraform`)
- AWS credentials configured with appropriate permissions for `ap-southeast-1`
- Working directory: `/mnt/sg_workspace/user/global-settings`

### Initialize Terraform

```bash
cd /mnt/sg_workspace/user/global-settings
/tmp/tmp.lkAOdl/terraform init
```

### Plan Changes

To review what Terraform would do:

```bash
/tmp/tmp.lkAOdl/terraform plan -var-file=environments/sg.tfvars
```

Expected output for the current state: `Plan: 0 to add, 0 to change, 0 to destroy` (configuration matches discovered resources).

### Apply Changes

To apply the configuration:

```bash
/tmp/tmp.lkAOdl/terraform apply -var-file=environments/sg.tfvars
```

### Targeting Another Environment (e.g., dev → prod)

To manage resources in a different environment:

1. **Copy the tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** to change resource names and settings as needed:
   ```bash
   vim environments/prod.tfvars
   ```

3. **Plan and apply with the new file** (no `.tf` code changes required):
   ```bash
   /tmp/tmp.lkAOdl/terraform plan -var-file=environments/prod.tfvars
   /tmp/tmp.lkAOdl/terraform apply -var-file=environments/prod.tfvars
   ```

The module structure allows unlimited environments to coexist in the same Terraform state, differentiated by their variable file.

---

## 6. Variables

### Root-Level Input Variables

#### `cloudformation_stacks`

**Type:** `map(object({...}))`  
**Default:** `{}`  
**Description:** Map of CloudFormation stacks to manage.

**Object schema:**
- `name` (string, required) — Name of the CloudFormation stack
- `disable_rollback` (bool, optional, default: `false`) — Disable rollback on stack creation failure
- `notification_arns` (list(string), optional, default: `[]`) — SNS topic ARNs for stack notifications
- `tags` (map(string), optional, default: `{}`) — Tags to apply to the stack

**Current value** (from `environments/sg.tfvars`):
```hcl
cloudformation_stacks = {
  stulyze_app = {
    name              = "stulyze-app"
    disable_rollback  = false
    notification_arns = []
    tags              = {}
  }
}
```

#### `athena_workgroups`

**Type:** `map(object({...}))`  
**Default:** `{}`  
**Description:** Map of Athena workgroups to manage.

**Object schema:**
- `name` (string, required) — Name of the Athena workgroup
- `description` (string, optional, default: `""`) — Description of the workgroup
- `state` (string, optional, default: `"ENABLED"`) — State of the workgroup (`"ENABLED"` or `"DISABLED"`)
- `enforce_workgroup_configuration` (bool, optional, default: `true`) — Enforce workgroup configuration for all queries
- `publish_cloudwatch_metrics_enabled` (bool, optional, default: `true`) — Publish CloudWatch metrics for the workgroup
- `tags` (map(string), optional, default: `{}`) — Tags to apply to the workgroup

**Current value** (from `environments/sg.tfvars`):
```hcl
athena_workgroups = {
  primary = {
    name                              = "primary"
    description                       = ""
    state                             = "ENABLED"
    enforce_workgroup_configuration   = false
    publish_cloudwatch_metrics_enabled = true
    tags                              = {}
  }
}
```

### Sensitive Variables

**No sensitive variables are present in this configuration.** All discovered resource attributes were non-sensitive. A `secrets.auto.tfvars` file is not required.

---

## 7. Infrastructure Graph

```
root
├── module.cloudformation_stack["stulyze_app"]
│   └── aws_cloudformation_stack.this
│       └── CloudFormation Stack ARN: arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518
│           └── Nested Resource: DynamoDB Table (stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG)
│
└── module.athena_workgroup["primary"]
    └── aws_athena_workgroup.this
        └── Athena Workgroup: primary
            └── Configuration
                ├── enforce_workgroup_configuration = false
                └── publish_cloudwatch_metrics_enabled = true
```

**Notes:**
- No cross-resource dependencies exist between the CloudFormation stack and Athena workgroup
- Each module is independent and can be modified or removed without affecting the other
- The DynamoDB table is created by the CloudFormation stack (not directly managed by Terraform)

---

## 8. Notable Decisions & Caveats

### Provider Compatibility

- **`enable_termination_protection` not used:** The discovered CloudFormation stack had `enable_termination_protection = true` in the cloud, but the AWS Terraform provider v6 does not accept this as an argument. It was omitted from the configuration. Drift on this attribute is expected and will not be reported by `terraform plan`.

### Athena Workgroup Configuration

- **`enforce_workgroup_configuration` explicitly set to `false`:** Although the provider default is `true`, the discovered resource showed `false`. This value was explicitly included in `environments/sg.tfvars` to match the actual cloud state.

### Empty Values

- **Empty strings and empty collections preserved:** Configuration explicitly includes empty values (`description = ""`, `tags = {}`, `notification_arns = []`) for clarity and future modifications. These map to optional fields with matching defaults and do not introduce drift.

### Naming Conventions

- **Snake case for map keys:** All module instantiation keys use snake_case (`stulyze_app`, `primary`) per standard Terraform conventions.

### Lifecycle Policies

- **No `ignore_changes` blocks required:** The current configuration reconciles perfectly with the discovered resources. The `terraform plan` output shows `0 to add, 0 to change, 0 to destroy` — no lifecycle policies are necessary.

### State Management

- **Import process complete:** Both resources have been imported into state. Running `imports.sh` again is not necessary unless state is lost or resources are deleted from the cloud and need to be re-discovered.

---

## File Structure

```
/mnt/sg_workspace/user/global-settings/
├── main.tf                          # Root module: for_each instantiation
├── variables.tf                     # Root input variables
├── outputs.tf                       # (empty)
├── versions.tf                      # Provider versions
├── providers.tf                     # AWS provider config
├── environments/
│   └── sg.tfvars                    # Current environment values
├── modules/
│   ├── cloudformation_stack/
│   │   ├── main.tf                  # CloudFormation stack resource
│   │   ├── variables.tf             # Module input variables
│   │   └── outputs.tf               # Module outputs
│   └── athena_workgroup/
│       ├── main.tf                  # Athena workgroup resource
│       ├── variables.tf             # Module input variables
│       └── outputs.tf               # Module outputs
├── imports.sh                       # Import script (run once to populate state)
└── .sg/
    └── DOCUMENTATION.md             # This file
```
