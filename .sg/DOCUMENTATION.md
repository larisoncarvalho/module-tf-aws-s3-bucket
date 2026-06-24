# Terraform Infrastructure Documentation

## 1. Overview

This Terraform/OpenTofu configuration manages **2 AWS resources** across a single region (ap-southeast-1):

1. **AWS CloudFormation Stack** (`stulyze-app`) — Created on 2023-07-28, contains a DynamoDB table exported as `StulyzeResourceTableName`.
2. **AWS Athena Workgroup** (`primary`) — The default workgroup configured with Athena engine version 3 (AUTO), publishing CloudWatch metrics enabled.

**How this code was generated:**
- Infrastructure resources were discovered via cloud scanning (SG Infra2Code).
- Terraform code was auto-generated from the discovered resources.
- All resources were imported into state using `imports.sh`.
- State was reconciled (terraform plan showed **0 to add, 0 to change, 0 to destroy**) — no further changes needed.

## 2. Resources

| Terraform Address | Provider | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.aws_cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this` | `aws` | `arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518` | CloudFormation stack managing nested infrastructure including DynamoDB table |
| `module.aws_athena_workgroup["primary"].aws_athena_workgroup.this` | `aws` | `primary` | Athena query workgroup for running SQL analytics against S3 data |

## 3. Module Structure

The code uses two internal modules, both in `./modules/`:

### `modules/aws_cloudformation_stack`
- **Resources:** `aws_cloudformation_stack.this` — wraps AWS CloudFormation stack creation
- **Source:** Local module at `./modules/aws_cloudformation_stack`
- **Call style:** `for_each = var.aws_cloudformation_stacks` from root
- **Inputs:** 
  - `name` (required): Stack name
  - `disable_rollback` (optional, default: `false`): Rollback behavior
  - `notification_arns` (optional, default: `[]`): SNS topic ARNs for notifications
  - `tags` (optional, default: `{}`): Tags
- **Outputs:** 
  - `id`: Stack ARN
  - `outputs`: CloudFormation stack outputs (exported values)

### `modules/aws_athena_workgroup`
- **Resources:** `aws_athena_workgroup.this` — creates Athena workgroup with configuration and engine version
- **Source:** Local module at `./modules/aws_athena_workgroup`
- **Call style:** `for_each = var.aws_athena_workgroups` from root
- **Inputs:** 
  - `name` (required): Workgroup name
  - `description` (optional, default: `""`): Workgroup description
  - `enforce_workgroup_configuration` (optional, default: `true`): Enforce settings on clients
  - `publish_cloudwatch_metrics` (optional, default: `true`): Emit CloudWatch metrics
  - `requester_pays_enabled` (optional, default: `false`): Allow requester to pay query costs
  - `selected_engine_version` (optional, default: `"AUTO"`): Athena engine version
  - `tags` (optional, default: `{}`): Tags
- **Outputs:** 
  - `id`: Workgroup name/ID

**No external git:: modules used.** All code is local.

## 4. How Import Works

The `imports.sh` script maps each resource to its cloud ID and imports it into state:

```bash
#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.aws_athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
"$1" import -var-file environments/sg.tfvars 'module.aws_cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
```

**How it works:**
1. The script was run once to populate Terraform state from AWS cloud resources.
2. Each `terraform import` command adds the real resource into state under the specified address.
3. **The script need not be re-run** unless state is lost.

**To re-import a single resource if state is lost:**
```bash
# Re-import the primary Athena workgroup
terraform import -var-file environments/sg.tfvars \
  'module.aws_athena_workgroup["primary"].aws_athena_workgroup.this' \
  'primary'

# Re-import the stulyze-app CloudFormation stack
terraform import -var-file environments/sg.tfvars \
  'module.aws_cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' \
  'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
```

## 5. How to Use the Code

### Initialize Terraform

```bash
terraform init
```

### Plan Changes

To preview changes with the default sg.tfvars:
```bash
terraform plan -var-file=environments/sg.tfvars
```

### Apply Changes

To apply the configuration:
```bash
terraform apply -var-file=environments/sg.tfvars
```

### Targeting Another Environment

To manage a different environment (e.g., dev instead of sg):

1. **Copy the tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the new file** with environment-specific values:
   ```bash
   # Edit environments/dev.tfvars
   # Change resource names, disable_rollback, tags, etc.
   ```

3. **Plan and apply with the new file** (no `.tf` edits needed):
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

## 6. Variables

### Root Module Variables

#### `aws_cloudformation_stacks`
- **Type:** `map(object({...}))`
- **Description:** Map of CloudFormation stacks to manage
- **Default:** `{}`
- **Example:**
  ```hcl
  aws_cloudformation_stacks = {
    stulyze_app = {
      name             = "stulyze-app"
      disable_rollback = false
      notification_arns = []
      tags = {}
    }
  }
  ```
- **Object fields:**
  - `name` (required): Stack name
  - `disable_rollback` (optional, default: `false`): Disable rollback on failure
  - `notification_arns` (optional, default: `[]`): SNS notification ARNs
  - `tags` (optional, default: `{}`): Resource tags

#### `aws_athena_workgroups`
- **Type:** `map(object({...}))`
- **Description:** Map of Athena workgroups to manage
- **Default:** `{}`
- **Example:**
  ```hcl
  aws_athena_workgroups = {
    primary = {
      name                            = "primary"
      description                     = ""
      enforce_workgroup_configuration = false
      publish_cloudwatch_metrics      = true
      requester_pays_enabled          = false
      selected_engine_version         = "AUTO"
      tags = {}
    }
  }
  ```
- **Object fields:**
  - `name` (required): Workgroup name
  - `description` (optional, default: `""`): Description
  - `enforce_workgroup_configuration` (optional, default: `true`): Enforce settings on clients
  - `publish_cloudwatch_metrics` (optional, default: `true`): Publish CloudWatch metrics
  - `requester_pays_enabled` (optional, default: `false`): Enable requester pays
  - `selected_engine_version` (optional, default: `"AUTO"`): Engine version
  - `tags` (optional, default: `{}`): Resource tags

### Sensitive Variables

**No sensitive variables are defined in this stack.** The discovered resources contained no credentials or secret values, so no `secrets.auto.tfvars` file is needed.

## 7. Infrastructure Graph

```
root
├── module.aws_cloudformation_stack["stulyze_app"]
│   └── aws_cloudformation_stack.this
│       │ name: "stulyze-app"
│       │ outputs: { "StulyzeResourceTableName": "stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG" }
│       └── (manages CloudFormation stack with nested DynamoDB table)
│
└── module.aws_athena_workgroup["primary"]
    └── aws_athena_workgroup.this
        │ name: "primary"
        │ state: "ENABLED"
        │ engine_version.selected_engine_version: "AUTO"
        │ configuration.publish_cloudwatch_metrics_enabled: true
        │ configuration.enforce_workgroup_configuration: false
        │ configuration.requester_pays_enabled: false
        └── (query workgroup for Athena analytics)
```

## 8. Notable Decisions & Caveats

### Provider Limitation: CloudFormation Stack Termination Protection
- The `enable_termination_protection` attribute is **not supported** in the installed AWS provider version (v6.52.0) for `aws_cloudformation_stack`.
- It was discovered in the cloud resource but **intentionally omitted** from the Terraform code.
- If termination protection needs to be managed, upgrade the provider or manage it via the AWS Console/CLI.

### Computed Attributes Omitted
- `aws_athena_workgroup` `state` field is a **computed attribute** managed by AWS (not configurable).
- It is **omitted from the configuration** — the provider always sets `state = "ENABLED"` in code, but reads the actual state from AWS.

### Empty Defaults Omitted from Variables File
- `description = ""` (empty string) and `tags = {}` (empty map) are default values defined in the module.
- They are **not explicitly set in `sg.tfvars`** to keep the file concise.
- They can be overridden in `.tfvars` files if needed.

### No Lifecycle Ignore Changes
- Neither resource type requires `lifecycle { ignore_changes }` blocks.
- All attributes are either user-configurable (in `.tfvars`) or computed (managed by AWS).

### Reconciliation Status
- **First import: Clean** — No changes needed after import.
- **Final plan result:** 0 to add, 0 to change, 0 to destroy.
- All resources are now tracked in Terraform state and match the cloud configuration.

### Region Pinned to ap-southeast-1
- The AWS provider is configured for the `ap-southeast-1` region only (see `providers.tf`).
- All resources are created and managed in this region.
- To manage resources in other regions, modify `providers.tf` or create a provider alias.
