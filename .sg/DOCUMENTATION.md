# Terraform Infrastructure Documentation: global-settings

## 1. Overview

This Terraform configuration manages **AWS Athena query workgroups** in the AWS region `ap-southeast-1`. 

The infrastructure code was:
- **Generated from discovered cloud resources** via infra2code tooling
- **Reconciled by importing** cloud resources into Terraform state using the `imports.sh` script
- **Verified to be in sync** — final `terraform plan` showed 0 resources to add/change/destroy

Currently, the configuration manages **one Athena workgroup** ("primary") that was discovered and imported. The code is fully parameterized via `var.athena_workgroups`, making it easy to add or modify additional workgroups without changing `.tf` files.

---

## 2. Resources

| Terraform Address | Resource Type | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.athena_workgroup["primary"].aws_athena_workgroup.this` | `aws_athena_workgroup` | `primary` (ARN: `arn:aws:athena:ap-southeast-1:714114208215:workgroup/primary`) | Primary Athena query workgroup; handles query execution, metrics publishing, and engine versioning |

---

## 3. Module Structure

### Root Module
- **Location:** `/mnt/sg_workspace/user/global-settings/`
- **Files:**
  - `main.tf` — instantiates `module.athena_workgroup` using `for_each` over `var.athena_workgroups`
  - `variables.tf` — defines `aws_region` and `athena_workgroups` input variable
  - `versions.tf` — requires Terraform ≥ 1.3.0 and AWS provider ≥ 4.0.0
  - `providers.tf` — configures AWS provider with region from variable
  - `outputs.tf` — no singleton outputs (each workgroup's IDs available via module outputs)
  - `environments/sg.tfvars` — environment-specific variable values for the primary workgroup

### Submodule: `modules/athena_workgroup`
- **Location:** `/mnt/sg_workspace/user/global-settings/modules/athena_workgroup/`
- **Type:** Local module (reusable, called via `for_each`)
- **Files:**
  - `main.tf` — defines `aws_athena_workgroup.this` resource
  - `variables.tf` — declares 8 input variables (name, description, state, configuration flags, engine version, tags)
  - `outputs.tf` — exports `id` (workgroup name) and `arn` (workgroup ARN)
- **Resource Types Covered:** `aws_athena_workgroup`
- **Call Style:** `for_each` keyed by workgroup name (e.g., `module.athena_workgroup["primary"]`)
- **Inputs:**
  - `name` (required) — workgroup name
  - `description` (optional, default "") — workgroup description
  - `state` (optional, default "ENABLED") — workgroup state
  - `enforce_workgroup_configuration` (optional, default true) — enforces settings on all queries
  - `publish_cloudwatch_metrics_enabled` (optional, default true) — CloudWatch metrics publishing
  - `requester_pays_enabled` (optional, default false) — requester-pays mode
  - `selected_engine_version` (optional, default "AUTO") — Athena engine version
  - `tags` (optional, default {}) — AWS tags

---

## 4. How Import Works

### Initial Import (Already Complete)

The `imports.sh` script contains the command that was run **once** to populate Terraform state from the discovered cloud resource:

```bash
terraform import -var-file environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
```

**What this did:**
- Located the real AWS Athena workgroup named `primary` in the account/region
- Created a corresponding Terraform state entry at the address `module.athena_workgroup["primary"].aws_athena_workgroup.this`
- Read all attributes from the API (name, configuration, engine version, tags, etc.)
- Stored them in `terraform.tfstate`

**Status:** This has already been executed; state is synchronized with the cloud resource.

### Re-importing a Single Resource (If State Lost)

If the Terraform state file is lost or corrupted and you need to re-import the primary workgroup:

```bash
terraform init -upgrade
terraform import -var-file=environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
```

The import command maps the module address (left side) to the cloud resource ID (right side: `primary`). The module address must match the `for_each` key in `main.tf`.

### Adding a New Workgroup

To add a second workgroup without re-importing, simply add an entry to `environments/sg.tfvars`:

```hcl
athena_workgroups = {
  primary = { ... },
  secondary = {
    name                               = "secondary"
    description                        = "Secondary workgroup"
    state                              = "ENABLED"
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    selected_engine_version            = "AUTO"
    tags                               = {}
  }
}
```

Then:
```bash
terraform plan -var-file=environments/sg.tfvars
terraform apply -var-file=environments/sg.tfvars
```

The new workgroup will be created in AWS. No import needed.

---

## 5. How to Use the Code

### Prerequisites
- Terraform/OpenTofu ≥ 1.3.0 installed
- AWS credentials configured (`~/.aws/credentials` or environment variables)
- Access to AWS account `714114208215` with permissions to manage Athena workgroups

### Initialize Terraform

```bash
cd /mnt/sg_workspace/user/global-settings
terraform init
```

This downloads the AWS provider and initializes the working directory.

### Plan Changes

To see what Terraform will do (without making changes):

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output (after reconciliation): `Plan: 0 to add, 0 to change, 0 to destroy.`

### Apply Changes

To create or modify resources:

```bash
terraform apply -var-file=environments/sg.tfvars
```

Terraform will prompt for confirmation before applying. Type `yes` to proceed.

### Targeting Environments

The current setup uses a single environment file `environments/sg.tfvars`. To manage multiple environments (e.g., dev, staging, prod):

1. **Create environment files:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit environment-specific values** (without touching `.tf` files):
   ```bash
   # environments/dev.tfvars
   aws_region = "us-east-1"
   athena_workgroups = {
     dev_primary = { ... }
   }
   ```

3. **Plan/apply using the target environment file:**
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

**Key advantage:** No `.tf` code changes needed; all environment differences live in `.tfvars` files.

### Useful Commands

```bash
# Show current state
terraform state list
terraform state show 'module.athena_workgroup["primary"].aws_athena_workgroup.this'

# Destroy all resources
terraform destroy -var-file=environments/sg.tfvars

# Refresh state from cloud
terraform refresh -var-file=environments/sg.tfvars

# Format code
terraform fmt -recursive
```

---

## 6. Variables

### Root-Level Variables

#### `aws_region`
- **Type:** `string`
- **Default:** `"ap-southeast-1"`
- **Description:** AWS region where Athena workgroups are created
- **Example:** `aws_region = "us-east-1"`

#### `athena_workgroups`
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Description:** Map of Athena workgroups keyed by workgroup name
- **Subfields:**
  - `name` (string, required) — Workgroup name
  - `description` (string, optional, default "") — Workgroup description
  - `state` (string, optional, default "ENABLED") — Workgroup state ("ENABLED" or "DISABLED")
  - `enforce_workgroup_configuration` (bool, optional, default true) — Enforce config on all queries
  - `publish_cloudwatch_metrics_enabled` (bool, optional, default true) — Publish CloudWatch metrics
  - `requester_pays_enabled` (bool, optional, default false) — Enable requester-pays mode
  - `selected_engine_version` (string, optional, default "AUTO") — Athena engine version ("AUTO" or specific version)
  - `tags` (map(string), optional, default {}) — AWS resource tags

**Current Value** (from `environments/sg.tfvars`):
```hcl
athena_workgroups = {
  primary = {
    name                               = "primary"
    description                        = ""
    state                              = "ENABLED"
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    selected_engine_version            = "AUTO"
    tags                               = {}
  }
}
```

### Sensitive Variables

No sensitive variables (passwords, API keys, private IDs) are used in this configuration. All credentials are sourced from AWS environment variables or credential files, not from `.tfvars` files.

---

## 7. Infrastructure Graph

```
Root Module
└── aws_region = "ap-southeast-1" (provider configuration)

module.athena_workgroup["primary"]
└── aws_athena_workgroup.this
    ├── name: "primary"
    ├── configuration
    │   ├── enforce_workgroup_configuration: false
    │   ├── publish_cloudwatch_metrics_enabled: true
    │   ├── requester_pays_enabled: false
    │   └── engine_version.selected_engine_version: "AUTO"
    └── tags: {} (empty)
    
Real-World Resource (AWS)
└── Athena Workgroup "primary"
    └── ARN: arn:aws:athena:ap-southeast-1:714114208215:workgroup/primary
```

**Dependencies:**
- The workgroup has no dependencies on other resources (e.g., S3 output location, KMS keys, IAM roles are not configured in this stack)
- The workgroup is standalone and can be independently created/destroyed

---

## 8. Notable Decisions & Caveats

### Resource Decomposition
- **Single module per resource type:** The `athena_workgroup` module encapsulates one `aws_athena_workgroup` resource. This keeps the module simple and reusable via `for_each`.
- **No output location / KMS / execution role:** The discovered workgroup has no output location, customer content KMS key, or execution role configured. These are optional in Athena and are not managed in this configuration. If needed in the future, they can be added to the module variables and `.tfvars`.

### Non-Default Configuration
- **`enforce_workgroup_configuration = false`:** The module default (and provider default) is `true`. The discovered workgroup had this set to `false`, which has been preserved in `sg.tfvars`. This setting allows individual queries to override workgroup configuration settings.
- **All other settings use defaults:** `state = "ENABLED"`, metrics publishing enabled, requester-pays disabled, engine version "AUTO".

### No Lifecycle Blocks
- No `lifecycle { ignore_changes = [...] }` blocks are needed. All attributes are stable and readable from the API; no computed-only fields cause drift.

### Import Status
- All resources have been successfully imported; state matches the cloud.
- The `imports.sh` script is provided for reference only and need not be re-run unless state is lost.

### Known Limitations
- **No managed output location:** If you want Athena query results stored automatically, add `result_configuration` and `result_configuration.output_location` to the module.
- **No encryption configuration:** If you require encrypted output, add `result_configuration.encryption_configuration` to the module.
- **No IAM execution role:** If you need role-based access control, add an `execution_role_arn` variable to the module.

These can all be added as optional module inputs without breaking existing state.

---

## Summary

This is a **minimal, parameterized Terraform configuration** that manages one AWS Athena workgroup. The code is fully reconciled with the cloud state and ready for production use. To add or modify workgroups, edit only the `.tfvars` file; the `.tf` code is reusable and environment-agnostic.
