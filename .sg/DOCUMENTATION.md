# Infrastructure Documentation: global-settings

## 1. Overview

This Terraform codebase manages cloud infrastructure in AWS region `ap-southeast-1` (Singapore). The infrastructure was discovered from two existing cloud resources, code was generated to represent them, and the code was then imported into state until `terraform plan` showed **0 to add, 0 to change, 0 to destroy** — meaning the configuration precisely matches the live infrastructure.

**Managed services:**
- **AWS Athena Workgroup** (primary workgroup for SQL query execution)
- **AWS CloudFormation Stack** (stulyze-app application stack containing a DynamoDB table)

## 2. Resources

| Terraform Address | Provider | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.athena_workgroup["primary"].aws_athena_workgroup.this` | `aws` | `primary` | Athena workgroup for federated SQL queries with CloudWatch metrics publishing enabled |
| `module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this` | `aws` | `stulyze-app` (ARN: `arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518`) | CloudFormation stack managing the Stulyze application, which provisions a DynamoDB table (`stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG`) |

## 3. Module Structure

### `modules/athena_workgroup/`
Manages a single `aws_athena_workgroup` resource.

**Files:**
- `main.tf` — declares `aws_athena_workgroup.this` with configuration block for engine version and metrics
- `variables.tf` — input parameters: `name`, `description`, `enforce_workgroup_configuration`, `publish_cloudwatch_metrics_enabled`, `requester_pays_enabled`, `selected_engine_version`, `state`
- `outputs.tf` — exports `id` (workgroup name) and `arn`

**Call pattern:** `for_each` over `var.athena_workgroups` (map of objects)

### `modules/cloudformation_stack/`
Manages a single `aws_cloudformation_stack` resource.

**Files:**
- `main.tf` — declares `aws_cloudformation_stack.this` with lifecycle rule to ignore template/parameter changes (see section 8)
- `variables.tf` — input parameters: `name`, `disable_rollback`, `enable_termination_protection`, `notification_arns`, `tags`
- `outputs.tf` — exports `id` (stack ARN) and `outputs` (CloudFormation outputs map)

**Call pattern:** `for_each` over `var.cloudformation_stacks` (map of objects)

### Root Configuration
- `versions.tf` — requires `hashicorp/aws` provider (no version constraint)
- `providers.tf` — configures `aws` provider for region `ap-southeast-1`
- `main.tf` — instantiates both modules with `for_each` loops
- `variables.tf` — declares `athena_workgroups` and `cloudformation_stacks` input variables
- `outputs.tf` — no scalar outputs; module outputs are accessible via `module.athena_workgroup[key]` and `module.cloudformation_stack[key]`

## 4. How Import Works

The file `imports.sh` contains two import commands that were run once to populate the Terraform state from discovered resources:

```bash
terraform import -var-file environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
terraform import -var-file environments/sg.tfvars 'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
```

**How it works:**
1. Each import command maps a Terraform address (module-qualified) to a cloud resource ID (name or ARN)
2. The Terraform state file (`terraform.tfstate`) is populated with the discovered resource attributes
3. Subsequent `plan` and `apply` commands compare this state against the HCL configuration

**To re-import a single resource** (if state is lost):
```bash
# For Athena workgroup:
terraform import -var-file environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'

# For CloudFormation stack:
terraform import -var-file environments/sg.tfvars 'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
```

(Note: The import scripts have already been run; they are not needed for normal plan/apply workflows.)

## 5. How to Use the Code

### Initialize the working directory
```bash
terraform init
```
This downloads the AWS provider and initializes the backend (default: local state in `.terraform/`).

### Plan with the shipped configuration
```bash
terraform plan -var-file=environments/sg.tfvars
```
This compares the current state against the HCL configuration using variables from `environments/sg.tfvars`. Expected output: **0 to add, 0 to change, 0 to destroy** (infrastructure matches code).

### Apply changes (if any)
```bash
terraform apply -var-file=environments/sg.tfvars
```
This would execute planned changes (create, update, destroy). Since the infrastructure is already in sync, no changes will occur.

### Target another environment
To manage infrastructure in a different environment (e.g., prod instead of sg):

1. **Copy and edit the variables file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** to change values (e.g., workgroup names, stack names, tags):
   ```bash
   # Edit environments/prod.tfvars
   # Example: change workgroup description, stack parameters, etc.
   ```

3. **Plan and apply using the new variables:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars
   ```

**No `.tf` edits required** — all environment-specific configuration is in `.tfvars` files.

## 6. Variables

### Input Variables

#### `var.athena_workgroups`
- **Type:** `map(object({...}))`
- **Description:** Map of Athena workgroups to manage; each key is the workgroup identifier, and the value is a configuration object.
- **Schema:**
  - `name` (required, string) — workgroup name in AWS
  - `description` (optional, string, default: `""`) — workgroup description
  - `enforce_workgroup_configuration` (optional, bool, default: `true`) — enforce workgroup settings
  - `publish_cloudwatch_metrics_enabled` (optional, bool, default: `true`) — send metrics to CloudWatch
  - `requester_pays_enabled` (optional, bool, default: `false`) — enable requester pays
  - `selected_engine_version` (optional, string, default: `"AUTO"`) — Athena engine version
  - `state` (optional, string, default: `"ENABLED"`) — workgroup state (`ENABLED` or `DISABLED`)
- **Current value (from `environments/sg.tfvars`):**
  ```hcl
  athena_workgroups = {
    primary = {
      name                               = "primary"
      description                        = ""
      enforce_workgroup_configuration    = false
      publish_cloudwatch_metrics_enabled = true
      requester_pays_enabled             = false
      selected_engine_version            = "AUTO"
      state                              = "ENABLED"
    }
  }
  ```

#### `var.cloudformation_stacks`
- **Type:** `map(object({...}))`
- **Description:** Map of CloudFormation stacks to manage; each key is the stack identifier, and the value is a configuration object.
- **Schema:**
  - `name` (required, string) — CloudFormation stack name in AWS
  - `disable_rollback` (optional, bool, default: `false`) — disable rollback on creation failure
  - `enable_termination_protection` (optional, bool, default: `false`) — enable termination protection
  - `notification_arns` (optional, list(string), default: `[]`) — SNS notification ARNs
  - `tags` (optional, map(string), default: `{}`) — tags to apply to the stack
- **Current value (from `environments/sg.tfvars`):**
  ```hcl
  cloudformation_stacks = {
    stulyze_app = {
      name                          = "stulyze-app"
      disable_rollback              = false
      enable_termination_protection = false
      notification_arns             = []
      tags                          = {}
    }
  }
  ```

### Sensitive Variables
**None** — no sensitive credentials or secrets are required. All attribute values are supplied via `.tfvars` files or passed on the command line.

## 7. Infrastructure Graph

```
root
├── module.athena_workgroup["primary"]
│   └── aws_athena_workgroup.this (primary)
│       └── [outputs: id, arn]
│
└── module.cloudformation_stack["stulyze_app"]
    └── aws_cloudformation_stack.this (stulyze-app)
        ├── [outputs: id, outputs]
        └── [managed CloudFormation resources: DynamoDB table]
```

**Dependency notes:**
- No explicit dependencies between the two modules (both are independent)
- The CloudFormation stack's internal resources (DynamoDB table) are managed by CloudFormation, not directly by Terraform
- Both modules use `for_each` and are keyed by their map keys (`"primary"` and `"stulyze_app"`)

## 8. Notable Decisions & Caveats

### CloudFormation Stack Template Management

The `aws_cloudformation_stack.this` resource includes the following lifecycle rule:

```hcl
lifecycle {
  ignore_changes = [
    template_body,
    template_url,
    parameters,
    capabilities,
    policy_body,
    policy_url,
  ]
}
```

**Rationale:** The `stulyze-app` CloudFormation stack was originally deployed via AWS CLI with `sam package` and `cloudformation deploy` (external tooling). The template and parameters are managed outside Terraform and must not be overwritten during Terraform plan/apply cycles. This `ignore_changes` directive ensures that:
- Manual stack updates via the AWS Console or CLI do not trigger Terraform changes
- Terraform focuses only on the stack's existence and lifecycle (name, tags, termination protection, notifications)
- The stack's template and resources remain under external (non-Terraform) management

**Implication:** If you need to update the CloudFormation template, do so via AWS CLI or Console; do not edit Terraform configuration to change `template_body` or `template_url`.

### Skipped Terraform Attributes

The following CloudFormation stack attributes are **not** managed by Terraform and are omitted from the HCL:
- `enable_termination_protection` — not a settable parameter in the discovered resource attributes; the variable exists for future use
- Stack outputs — derived from the CloudFormation template and automatically available in state; no manual input required

### Athena Workgroup Configuration

The `primary` workgroup is configured with:
- Engine version set to `AUTO` (use latest compatible version)
- `enforce_workgroup_configuration = false` — allows per-query overrides
- `publish_cloudwatch_metrics_enabled = true` — metrics sent to CloudWatch for monitoring
- No output location or encryption configured (uses defaults)

These settings match the discovered live configuration exactly.

### Remaining Drift

**None.** The final reconciliation showed **0 to add, 0 to change, 0 to destroy**. The Terraform state precisely matches the live infrastructure.

### Module Naming Conventions

- Module keys use snake_case: `primary`, `stulyze_app`
- Terraform resource addresses follow the pattern: `module.<module_name>[<key>].<resource_type>.this`
- Variable names use snake_case: `athena_workgroups`, `cloudformation_stacks`
