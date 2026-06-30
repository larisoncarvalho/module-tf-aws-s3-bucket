# Infrastructure Documentation: global-settings

## 1. Overview

This Terraform configuration manages AWS cloud infrastructure in the `ap-southeast-1` (Singapore) region. The infrastructure was originally discovered via cloud scanning, then codified into Terraform modules, imported into state, and reconciled until the final plan showed **0 additions / 0 changes / 0 deletions** — confirming that the configuration matches the live infrastructure exactly.

The stack manages two key AWS services:
- **CloudFormation stacks**: Higher-order infrastructure deployment units
- **Athena workgroups**: Query execution environments for SQL analytics on data in S3

All resources are managed via two local modules using `for_each` loops, allowing flexible, declarative management of multiple instances per service type.

---

## 2. Resources

| Terraform Address | Provider | Resource Type | Real-world Name/ID | Purpose |
|---|---|---|---|---|
| `module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this` | aws | `aws_cloudformation_stack` | `stulyze-app` (ARN: `arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518`) | Manages a CloudFormation stack that deploys the Stulyze application infrastructure, including a DynamoDB table (`stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG`). Template body and parameters are managed externally via AWS CLI. |
| `module.athena_workgroup["primary"].aws_athena_workgroup.this` | aws | `aws_athena_workgroup` | `primary` | Primary Athena workgroup for SQL query execution. Configured with Athena engine version 3 (AUTO), workgroup configuration enforcement disabled, and CloudWatch metrics enabled. |

---

## 3. Module Structure

### Root Module (`.`)

**Files:**
- `main.tf` — Two module calls: `cloudformation_stack` and `athena_workgroup`, each using `for_each` over variables
- `variables.tf` — Input variable definitions for `cloudformation_stacks` and `athena_workgroups` (both maps of objects)
- `outputs.tf` — Intentionally empty to avoid stale-null trap on `for_each` outputs
- `providers.tf` — Declares AWS provider for `ap-southeast-1` region
- `versions.tf` — Terraform version constraints (no specific version pinned; any recent version accepted)

### `modules/cloudformation_stack/`

**Purpose:** Abstracts AWS CloudFormation stack management.

**Files:**
- `main.tf`
  - Resource: `aws_cloudformation_stack.this`
  - Configuration: name, disable_rollback, notification_arns, tags
  - **Lifecycle rule:** Ignores changes to `template_body`, `template_url`, and `parameters` (see Notable Decisions below)
- `variables.tf`
  - `name` (required, string) — Stack name
  - `disable_rollback` (optional, bool, default: `false`) — Rollback behavior on creation failure
  - `notification_arns` (optional, list of strings, default: `[]`) — SNS topic ARNs for notifications
  - `tags` (optional, map of strings, default: `{}`) — Resource tags
- `outputs.tf`
  - `id` — Stack ARN
  - `outputs` — Nested map of CloudFormation stack outputs (e.g., `StulyzeResourceTableName`)

### `modules/athena_workgroup/`

**Purpose:** Abstracts AWS Athena workgroup management.

**Files:**
- `main.tf`
  - Resource: `aws_athena_workgroup.this`
  - Configuration: name, description, state, tags, nested `configuration` block (enforce_workgroup_configuration, publish_cloudwatch_metrics_enabled, requester_pays_enabled), nested `engine_version` block (selected_engine_version)
  - No lifecycle rules (all attributes managed normally)
- `variables.tf`
  - `name` (required, string) — Workgroup name
  - `description` (optional, string, default: `""`) — Workgroup description
  - `state` (optional, string, default: `"ENABLED"`) — Workgroup state (ENABLED or DISABLED)
  - `enforce_workgroup_configuration` (optional, bool, default: `true`) — Enforce query configuration
  - `publish_cloudwatch_metrics_enabled` (optional, bool, default: `true`) — CloudWatch metrics publishing
  - `requester_pays_enabled` (optional, bool, default: `false`) — Cross-account query cost attribution
  - `selected_engine_version` (optional, string, default: `"AUTO"`) — Athena SQL engine version
  - `tags` (optional, map of strings, default: `{}`) — Resource tags
- `outputs.tf`
  - `id` — Workgroup name
  - `arn` — Workgroup ARN

---

## 4. How Import Works

### Initial Import (Already Completed)

The file `imports.sh` was run once during initial codification to populate Terraform state with discovered AWS resources. It contains two import commands:

```bash
"$1" import -var-file environments/sg.tfvars 'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
"$1" import -var-file environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
```

**What happened:**
1. Each discovered resource was matched to a Terraform address (e.g., `module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this`)
2. The import command linked the remote AWS resource (by ARN or name) to the local state
3. The process ran until `terraform plan` showed 0/0/0, indicating full reconciliation

**The `$1` placeholder** refers to the Terraform/OpenTofu binary passed as the first argument when executing the script.

### Re-importing a Single Resource (If State Is Lost)

If state is accidentally deleted or corrupted, re-import a single resource using:

```bash
terraform import -var-file environments/sg.tfvars 'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
```

Or for Athena:

```bash
terraform import -var-file environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
```

**Do NOT re-run `imports.sh` unnecessarily** — the script is a historical record. Run individual `import` commands only when recovering lost state.

---

## 5. How to Use the Code

### Prerequisites

Ensure you have:
- Terraform or OpenTofu binary installed
- AWS credentials configured (via `~/.aws/credentials`, environment variables, or IAM role)
- Access to the `ap-southeast-1` region in AWS account `714114208215`

### Initialize Terraform

```bash
terraform init
```

This downloads the AWS provider and prepares the working directory. Safe to run multiple times.

### Plan Changes

Preview changes without modifying infrastructure:

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output (when reconciled): **Plan: 0 to add, 0 to change, 0 to destroy**

### Apply Changes

Execute the plan (idempotent — safe to run repeatedly):

```bash
terraform apply -var-file=environments/sg.tfvars
```

You will be prompted to review and confirm before any resources are modified.

To skip the prompt (CI/CD):

```bash
terraform apply -var-file=environments/sg.tfvars -auto-approve
```

### Targeting Another Environment (e.g., dev → prod)

The code is parameterized via `environments/sg.tfvars`. To manage a different environment:

1. **Copy and rename the variables file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** to update resource names, settings, and tags for the prod environment:
   ```hcl
   cloudformation_stacks = {
     stulyze_app_prod = {
       name             = "stulyze-app-prod"
       disable_rollback = true
     }
   }
   athena_workgroups = {
     primary_prod = {
       name                               = "primary-prod"
       enforce_workgroup_configuration    = true
       publish_cloudwatch_metrics_enabled = true
     }
   }
   ```

3. **Plan and apply with the new file:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars
   ```

**No `.tf` file edits are required** — all infrastructure shape and naming is controlled via the `.tfvars` file.

### Destroy Infrastructure

Remove all managed resources:

```bash
terraform destroy -var-file=environments/sg.tfvars
```

You will be prompted to confirm. Use `-auto-approve` to skip confirmation.

---

## 6. Variables

### Root-Level Input Variables

#### `cloudformation_stacks`
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Description:** Map of CloudFormation stacks to manage. Each key becomes the module instance key (e.g., `stulyze_app`).
- **Schema:**
  - `name` (required, string) — Stack name in AWS
  - `disable_rollback` (optional, bool, default: `false`) — Whether to disable automatic rollback on creation failure
  - `notification_arns` (optional, list of strings, default: `[]`) — SNS topic ARNs for stack event notifications
  - `tags` (optional, map of strings, default: `{}`) — Resource tags

**Current value** (from `environments/sg.tfvars`):
```hcl
cloudformation_stacks = {
  stulyze_app = {
    name             = "stulyze-app"
    disable_rollback = false
  }
}
```

#### `athena_workgroups`
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Description:** Map of Athena workgroups to manage. Each key becomes the module instance key (e.g., `primary`).
- **Schema:**
  - `name` (required, string) — Workgroup name in AWS
  - `description` (optional, string, default: `""`) — Workgroup description
  - `state` (optional, string, default: `"ENABLED"`) — Workgroup state (`ENABLED` or `DISABLED`)
  - `enforce_workgroup_configuration` (optional, bool, default: `true`) — Whether to enforce the workgroup's SQL dialect and result configuration for all queries
  - `publish_cloudwatch_metrics_enabled` (optional, bool, default: `true`) — Whether to publish CloudWatch metrics
  - `requester_pays_enabled` (optional, bool, default: `false`) — Whether to enable requester-pays for cross-account query access
  - `selected_engine_version` (optional, string, default: `"AUTO"`) — Athena SQL engine version (`AUTO`, `AUTO_V2`, `V2`, `V3`, or specific version like `Athena engine version 3`)
  - `tags` (optional, map of strings, default: `{}`) — Resource tags

**Current value** (from `environments/sg.tfvars`):
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
  }
}
```

### Sensitive Variables

**No sensitive variables are present in this configuration.** The handoff notes that no credential-like values were discovered, and `secrets.auto.tfvars` was not created. All variable values are directly in `environments/sg.tfvars` (or can be overridden via command-line `-var` flags if desired).

### Overriding Variables at Runtime

Pass variables via command-line without editing files:

```bash
terraform plan -var-file=environments/sg.tfvars \
  -var 'cloudformation_stacks={"custom_stack":{"name":"my-stack","disable_rollback":true}}'
```

---

## 7. Infrastructure Graph

```
Root Module
│
├── module.cloudformation_stack (for_each over var.cloudformation_stacks)
│   │
│   └── ["stulyze_app"]
│       └── aws_cloudformation_stack.this
│           │   name: "stulyze-app"
│           │   region: ap-southeast-1
│           │   account: 714114208215
│           │
│           └── [Managed externally]
│               └── AWS::DynamoDB::Table (stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG)
│                   [Output: StulyzeResourceTableName]
│
└── module.athena_workgroup (for_each over var.athena_workgroups)
    │
    └── ["primary"]
        └── aws_athena_workgroup.this
            │   name: "primary"
            │   region: ap-southeast-1
            │   account: 714114208215
            │   state: ENABLED
            │   engine_version: AUTO (v3)
            │
            └── [No nested resources or dependencies]
```

**Notes on the graph:**
- **No direct dependencies** exist between the CloudFormation stack and Athena workgroup — they are independent.
- The **DynamoDB table** is a child of the CloudFormation stack but is managed by CloudFormation itself, not Terraform. Terraform only manages the stack's existence and lifecycle, not the table's schema.
- No **security groups**, **VPCs**, or **networking** is defined — both resources use AWS defaults.

---

## 8. Notable Decisions & Caveats

### CloudFormation Stack: Template Externally Managed

**Decision:** The `lifecycle { ignore_changes }` block in `modules/cloudformation_stack/main.tf` ignores changes to `template_body`, `template_url`, and `parameters`.

**Reason:** The `stulyze-app` stack was originally deployed via AWS CLI using the CloudFormation package deployment workflow (`awscli-cloudformation-package-deploy-*`). The template body is not present in the discovery data and is managed outside of Terraform. Allowing Terraform to manage these attributes would risk:
- Accidental overwrites of the live template during `plan`/`apply`
- Drift reports when the CLI-deployed template differs from what Terraform sees
- Loss of stack state if template is reset to empty values

**Impact:** Terraform manages the stack's **existence and lifecycle** (creation, deletion) but does not manage template updates. To update the template, use the AWS CLI or CloudFormation console directly. The stack's `name`, `disable_rollback`, `notification_arns`, and `tags` are still fully managed by Terraform.

### `enable_termination_protection` Omitted

**Decision:** The `aws_cloudformation_stack` resource does not include the `enable_termination_protection` argument.

**Reason:** The argument is not supported in the AWS provider version in use. It was discovered in the cloud state but cannot be configured via this version of the Terraform AWS provider. Attempting to set it would cause an `unsupported argument` error.

**Impact:** Termination protection must be managed outside of Terraform (via AWS console or CLI) if needed.

### Athena Workgroup: Non-Default Engine Version

**Decision:** The `athena_workgroup` module is configured with `selected_engine_version = "AUTO"` in the `engine_version` block.

**Reason:** The discovered workgroup uses the default Athena engine version 3 (AUTO), but the module variable defaults to `"AUTO"` with the nested `engine_version` block structure required by the Terraform provider. This ensures:
- The live state (engine version 3) remains unchanged during `plan`/`apply`
- Future engine upgrades can be handled via the `selected_engine_version` variable

**Impact:** The workgroup automatically uses the latest Athena SQL engine version unless explicitly pinned to a specific version via the variable.

### Athena Workgroup: Configuration Enforcement Disabled

**Decision:** The `enforce_workgroup_configuration` is set to `false` in `environments/sg.tfvars`.

**Reason:** The discovered workgroup has this setting disabled, matching the live state. This allows individual queries to override workgroup configuration (e.g., result location, encryption settings).

**Impact:** Queries in this workgroup are not forced to use the workgroup's configuration settings. This is more permissive but less consistent; change to `true` in `sg.tfvars` if uniform query behavior is required.

### No Computed Attributes in State

**Decision:** Module outputs (`id`, `arn`, etc.) are derived directly from resource attributes without additional transformation.

**Reason:** The AWS provider returns authoritative values for resource identifiers (CloudFormation stack ARN, Athena workgroup ARN) that match the source of truth in AWS. No additional computed attributes (e.g., derived URIs, formatted IDs) are created.

**Impact:** Output values directly reflect AWS state and do not require state refresh on every `plan`.

### Stale-Null Trap Avoidance

**Decision:** Root module `outputs.tf` is intentionally empty (no `for_each` enumeration outputs).

**Reason:** Terraform `for_each` outputs create a null value when instances are destroyed, which can cause downstream references to fail. By avoiding root outputs entirely, consumers of this module can safely reference child module outputs directly if needed:
  ```hcl
  # Reference a specific instance:
  module.cloudformation_stack["stulyze_app"].outputs.id
  ```

**Impact:** Slightly more verbosity for external consumers but eliminates a class of stale-reference errors during scaling down.

### No Secrets Discovered

**Decision:** No `secrets.auto.tfvars` file was created.

**Reason:** The discovery process found no credential-like values (API keys, passwords, tokens) in the live resources. All variable values are non-sensitive.

**Impact:** All variable values can be safely committed to version control in `environments/sg.tfvars`. If sensitive values are added in the future, manually create `secrets.auto.tfvars` with the pattern:
  ```hcl
  sensitive_var = "value"
  ```
  and add it to `.gitignore` to prevent accidental commits.

### Region Lock

**Decision:** The AWS provider is hard-coded to `ap-southeast-1` (Singapore).

**Reason:** All discovered resources exist in this region, and the configuration is region-specific (e.g., CloudFormation stack ARN includes region). Changing region would require re-importing resources in the new region.

**Impact:** To manage resources in a different region, either:
1. Create a separate stack with a new working directory and different `providers.tf`
2. Use Terraform workspaces to manage multiple regions (advanced)

---

## Appendix: File Manifest

```
.
├── .sg/
│   ├── DOCUMENTATION.md          (this file)
│   └── handoff.md                (per-module decisions from codification)
├── main.tf                        (root module: module calls)
├── variables.tf                   (root module: input variables)
├── outputs.tf                     (root module: outputs — intentionally empty)
├── providers.tf                   (AWS provider configuration)
├── versions.tf                    (Terraform version constraints)
├── imports.sh                     (historical import script — do not re-run)
├── environments/
│   └── sg.tfvars                  (variables for default environment)
└── modules/
    ├── cloudformation_stack/
    │   ├── main.tf                (aws_cloudformation_stack.this)
    │   ├── variables.tf           (module input variables)
    │   └── outputs.tf             (module outputs: id, outputs)
    └── athena_workgroup/
        ├── main.tf                (aws_athena_workgroup.this)
        ├── variables.tf           (module input variables)
        └── outputs.tf             (module outputs: id, arn)
```

---

**Generated:** 2026-06-24  
**Region:** ap-southeast-1 (Singapore)  
**Account:** 714114208215  
**Reconciliation Status:** ✓ Clean (0/0/0)
