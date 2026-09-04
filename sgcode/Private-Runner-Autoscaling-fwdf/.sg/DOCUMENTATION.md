# Terraform AWS Lambda Infrastructure Documentation

## 1. Overview

This infrastructure code manages two AWS Lambda functions that serve as autoscalers for StackGuardian private runner environments. The code was generated from discovered cloud resources in the `eu-central-1` region (account ID: `790543352839`) and imported into Terraform state until reconciliation showed **0 changes** (0 to add, 0 to change, 0 to destroy).

The Lambda functions are containerized (Image-based) deployments with arm64 architecture, each configured with:
- Environment-specific autoscaling thresholds and cooldown periods
- CloudWatch Logs integration with 14-day retention
- Pre-existing IAM roles referenced by ARN (not managed by this code)
- Container images hosted in AWS ECR
- StackGuardian API integration via sensitive API keys

## 2. Resources

| Terraform Address | Provider | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.lambda_functions["neha_private_runner_autoscale_private_runner"].aws_lambda_function.this[0]` | `aws_lambda_function` | `Neha_Private_Runner-autoscale-private-runner` | Autoscaler Lambda for Neha's private runner environment; manages scaling of ASG `Neha_Private_Runner-private-runner-asg` based on pending job count |
| `module.lambda_functions["neha_private_runner_autoscale_private_runner"].aws_cloudwatch_log_group.lambda[0]` | `aws_cloudwatch_log_group` | `/aws/lambda/Neha_Private_Runner-autoscale-private-runner` | CloudWatch Logs for Neha's autoscaler function; 14-day retention |
| `module.lambda_functions["sg_runner_new_autoscale_private_runner"].aws_lambda_function.this[0]` | `aws_lambda_function` | `SG_RUNNER_new-autoscale-private-runner` | Autoscaler Lambda for SG_RUNNER_new private runner environment; manages scaling of ASG `SG_RUNNER_new-private-runner-asg` |
| `module.lambda_functions["sg_runner_new_autoscale_private_runner"].aws_cloudwatch_log_group.lambda[0]` | `aws_cloudwatch_log_group` | `/aws/lambda/SG_RUNNER_new-autoscale-private-runner` | CloudWatch Logs for SG_RUNNER_new's autoscaler function; 14-day retention |

## 3. Module Structure

### Root Configuration Files

- **`main.tf`** — Module declaration with `for_each` loop over `var.lambda_functions` map; merges environment variables with sensitive API keys.
- **`variables.tf`** — Input variable definitions:
  - `lambda_functions`: Map of Lambda configurations (function_name, architecture, memory, timeout, package_type, image_uri, lambda_role, environment variables, etc.)
  - `lambda_sg_api_keys`: Sensitive map of API keys (routed to `secrets.auto.tfvars`)
- **`versions.tf`** — Terraform version constraint (AWS provider >= 5.0)
- **`providers.tf`** — AWS provider configuration targeting `eu-central-1`
- **`outputs.tf`** — No singleton outputs (using `for_each` call)

### External Module

**`terraform-aws-lambda`**
- **Source**: `git::https://github.com/terraform-aws-modules/terraform-aws-lambda.git`
- **Call style**: `for_each` loop with two iterations: `neha_private_runner_autoscale_private_runner` and `sg_runner_new_autoscale_private_runner`
- **Key resources covered**:
  - `aws_lambda_function.this[0]` — Lambda function from container image
  - `aws_cloudwatch_log_group.lambda[0]` — CloudWatch Logs group
  - (IAM role creation disabled via `create_role = false`; roles are pre-existing)
  - (Package creation disabled via `create_package = false`; Image-based deployment)

## 4. How Import Works

The `imports.sh` script maps each Terraform resource address to its cloud resource ID via `terraform import` commands. The script was executed once to populate the initial state and **need not be re-run** unless state is lost.

### Import Commands

```bash
# Lambda function: Neha_Private_Runner
"$1" import -var-file environments/sg.tfvars \
  'module.lambda_functions["neha_private_runner_autoscale_private_runner"].aws_lambda_function.this[0]' \
  'Neha_Private_Runner-autoscale-private-runner'

# Lambda function: SG_RUNNER_new
"$1" import -var-file environments/sg.tfvars \
  'module.lambda_functions["sg_runner_new_autoscale_private_runner"].aws_lambda_function.this[0]' \
  'SG_RUNNER_new-autoscale-private-runner'

# CloudWatch Logs: Neha_Private_Runner
"$1" import -var-file environments/sg.tfvars \
  'module.lambda_functions["neha_private_runner_autoscale_private_runner"].aws_cloudwatch_log_group.lambda[0]' \
  '/aws/lambda/Neha_Private_Runner-autoscale-private-runner'

# CloudWatch Logs: SG_RUNNER_new
"$1" import -var-file environments/sg.tfvars \
  'module.lambda_functions["sg_runner_new_autoscale_private_runner"].aws_cloudwatch_log_group.lambda[0]' \
  '/aws/lambda/SG_RUNNER_new-autoscale-private-runner'
```

### Re-importing a Single Resource

If state for a single resource is lost, re-import it using:

```bash
# Replace with your Terraform/OpenTofu binary (e.g., terraform or tofu)
terraform import -var-file environments/sg.tfvars \
  'module.lambda_functions["<key>"].aws_lambda_function.this[0]' \
  '<function_name>'
```

Example for Neha's function:
```bash
terraform import -var-file environments/sg.tfvars \
  'module.lambda_functions["neha_private_runner_autoscale_private_runner"].aws_lambda_function.this[0]' \
  'Neha_Private_Runner-autoscale-private-runner'
```

## 5. How to Use the Code

### Prerequisites

- Terraform or OpenTofu binary installed
- AWS credentials configured (assumed via environment or `~/.aws/credentials`)
- `secrets.auto.tfvars` created with API keys (see **Variables** section)

### Initialize Terraform

```bash
terraform init
```

Or with OpenTofu:
```bash
tofu init
```

### Plan Infrastructure

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output: **No changes** (infrastructure already matches configuration).

### Apply Changes

```bash
terraform apply -var-file=environments/sg.tfvars
```

### Targeting Another Environment

To deploy to a different environment (e.g., `dev` instead of `sg`):

1. **Copy and edit the variables file**:
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   # Edit environments/dev.tfvars with new values:
   # - lambda_functions (function names, image URIs, ASG names, thresholds)
   # - Update environment variables (SG_BASE_URI, SG_ORG, SG_RUNNER_GROUP, etc.)
   ```

2. **Plan for the new environment**:
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   ```

3. **Apply**:
   ```bash
   terraform apply -var-file=environments/dev.tfvars
   ```

**No `.tf` file edits required** — all configuration is driven by `.tfvars` files.

## 6. Variables

### Input Variables

#### `lambda_functions` (Required, no default)
- **Type**: `map(object({...}))`
- **Description**: Map of Lambda function configurations
- **Structure**:
  - `function_name` (string, required) — Lambda function name (e.g., `"Neha_Private_Runner-autoscale-private-runner"`)
  - `architectures` (list(string), optional, default `["x86_64"]`) — CPU architecture (e.g., `["arm64"]`)
  - `memory_size` (number, optional, default `128`) — Memory allocation in MB
  - `timeout` (number, optional, default `3`) — Execution timeout in seconds
  - `package_type` (string, optional, default `"Zip"`) — `"Zip"` or `"Image"`
  - `image_uri` (string, optional) — ECR image URI (required for `package_type = "Image"`)
  - `lambda_role` (string, optional) — IAM role ARN (e.g., `"arn:aws:iam::790543352839:role/Neha_Private_Runner-autoscale-lambda-role"`)
  - `tracing_mode` (string, optional) — `"PassThrough"` or `"Active"`
  - `environment_variables` (map(string), optional) — Environment variables (excludes `SG_API_KEY`, which is added from `lambda_sg_api_keys`)
  - `cloudwatch_logs_retention_in_days` (number, optional) — Log retention period (e.g., `14`)
  - `ignore_source_code_hash` (boolean, optional, default `false`) — Skip hash tracking for Image-based lambdas

**Example from `environments/sg.tfvars`**:
```hcl
lambda_functions = {
  neha_private_runner_autoscale_private_runner = {
    function_name = "Neha_Private_Runner-autoscale-private-runner"
    architectures = ["arm64"]
    memory_size   = 128
    timeout       = 60
    package_type  = "Image"
    image_uri     = "790543352839.dkr.ecr.eu-central-1.amazonaws.com/private-runner/autoscaler:94db8a6-dirty"
    lambda_role   = "arn:aws:iam::790543352839:role/Neha_Private_Runner-autoscale-lambda-role"
    tracing_mode  = "PassThrough"
    environment_variables = {
      AWS_ASG_NAME              = "Neha_Private_Runner-private-runner-asg"
      AWS_BUCKET_NAME           = "7ungwu6v-private-runner-storage-backend"
      MIN_RUNNERS               = "1"
      SCALE_OUT_THRESHOLD       = "3"
      SCALE_IN_THRESHOLD        = "1"
      # ... more variables
    }
    cloudwatch_logs_retention_in_days = 14
    ignore_source_code_hash           = true
  }
  # ... more functions
}
```

#### `lambda_sg_api_keys` (Sensitive, Optional)
- **Type**: `map(string)`
- **Sensitive**: Yes (values are masked in state and logs)
- **Default**: `{}`
- **Description**: Map of StackGuardian API keys per Lambda function key
- **Usage**: Merged into environment variables as `SG_API_KEY` for each function

### Sensitive Variables (Routed to `secrets.auto.tfvars`)

These variables have **no values in the shipped `.tfvars` files** — their values must be provided separately:

#### `lambda_sg_api_keys`
You must create `secrets.auto.tfvars` with actual API keys before planning:

```hcl
# secrets.auto.tfvars (NOT SHIPPED — create locally)
lambda_sg_api_keys = {
  neha_private_runner_autoscale_private_runner  = "sgu_9ysx2FOo2wfMF1ZAUsK96"      # ⚠️ ROTATE UPSTREAM
  sg_runner_new_autoscale_private_runner        = "sgu_18uhWy8utEu1oWWsoYXvz"     # ⚠️ ROTATE UPSTREAM
}
```

**Alternative**: Pass via command line:
```bash
terraform plan -var-file=environments/sg.tfvars \
  -var 'lambda_sg_api_keys={"neha_private_runner_autoscale_private_runner":"sgu_..."}'
```

## 7. Infrastructure Graph

```
root (aws provider: eu-central-1)
├── module.lambda_functions["neha_private_runner_autoscale_private_runner"]
│   ├── aws_lambda_function.this[0]
│   │   ├── references: lambda_role (arn:aws:iam::790543352839:role/Neha_Private_Runner-autoscale-lambda-role)
│   │   ├── environment: {SG_API_KEY, AWS_ASG_NAME, AWS_BUCKET_NAME, MIN_RUNNERS, SCALE_*_THRESHOLD, ...}
│   │   └── logs_to: aws_cloudwatch_log_group.lambda[0]
│   └── aws_cloudwatch_log_group.lambda[0]
│       └── log_group: /aws/lambda/Neha_Private_Runner-autoscale-private-runner (14-day retention)
│
└── module.lambda_functions["sg_runner_new_autoscale_private_runner"]
    ├── aws_lambda_function.this[0]
    │   ├── references: lambda_role (arn:aws:iam::790543352839:role/SG_RUNNER_new-autoscale-lambda-role)
    │   ├── environment: {SG_API_KEY, AWS_ASG_NAME, AWS_BUCKET_NAME, MIN_RUNNERS, SCALE_*_THRESHOLD, ...}
    │   └── logs_to: aws_cloudwatch_log_group.lambda[0]
    └── aws_cloudwatch_log_group.lambda[0]
        └── log_group: /aws/lambda/SG_RUNNER_new-autoscale-private-runner (14-day retention)

Legend:
- references: attribute references to external resources (not managed by this code)
- logs_to: implicit CloudWatch Logs integration
- → : depends on
```

## 8. Notable Decisions & Caveats

### Image-Based Lambda Deployments

**Decision**: Both functions use `package_type = "Image"` with container images from ECR.

**Why**: Container images are managed externally (outside Terraform) and updated via CI/CD pipelines. The `ignore_source_code_hash = true` setting prevents spurious drift detection when the image URI or internal code changes but the Terraform configuration remains static.

### Pre-Existing IAM Roles

**Decision**: `create_role = false` — IAM roles are not created by this code but referenced by ARN.

**Why**: Roles are created and managed by a separate provisioning workflow and should not be recreated or destroyed by this Terraform code. The roles grant Lambda permissions to:
- Access AutoScaling Groups (describe, set desired capacity)
- Read from S3 buckets
- Call StackGuardian API
- Write to CloudWatch Logs

### No Package Creation

**Decision**: `create_package = false` — no Zip package generation, source code hashing, or Lambda deployment packages.

**Why**: Images are pre-built and pushed to ECR; Terraform only references them by URI. This avoids unnecessary local file operations and drift.

### CloudWatch Logs Retention

**Decision**: All log groups have 14-day retention (`cloudwatch_logs_retention_in_days = 14`).

**Why**: A middle ground between cost optimization and operational visibility. Logs older than 14 days are automatically deleted.

### for_each Module Call

**Decision**: `module.lambda_functions` uses `for_each = var.lambda_functions` to manage multiple functions with a single module call.

**Why**: Enables adding new autoscaler functions by simply adding entries to the `lambda_functions` map in `.tfvars` files, without modifying `.tf` code. Each function is independently addressable and scalable.

### Computed Attributes Omitted

The following attributes are computed (read-only) and not included in the configuration:
- `code_sha_256` — computed from image URI
- `code_size` — computed by AWS
- `version`, `revision_id` — AWS-managed
- `last_modified` — AWS-set timestamp

### Environment Variable Merging

**Decision**: `environment_variables` from `sg.tfvars` are merged with `SG_API_KEY` from `lambda_sg_api_keys` in `main.tf`.

**Why**: Separates static configuration (function names, ASG targets, scaling thresholds) from secrets (API keys), allowing secrets to be managed separately without editing main `.tf` or `.tfvars` files.

### Remaining Drift & Assumptions

- **External Scheduler Triggers**: Each Lambda is triggered by AWS EventBridge Scheduler rules (`Neha_Private_Runner-autoscale-trigger`, `SG_RUNNER_new-autoscale-trigger`). These triggers are **not managed by this code** — they are assumed to exist and are not imported. If they drift, this code will not detect or correct it.
- **Image URIs**: The `image_uri` values in `sg.tfvars` are static references to ECR images (e.g., `...autoscaler:94db8a6-dirty`). If images are rebuilt and pushed with new tags but `.tfvars` is not updated, Terraform will not detect the change. Updates require manual `.tfvars` edits or re-deployment workflows.
- **IAM Role Policies**: The policies attached to the referenced roles are not managed by this code and are assumed to grant Lambda sufficient permissions. Use `aws lambda get-policy` and role policy documents to audit.

### How `ignore_source_code_hash` Works

For Image-based Lambdas, setting `ignore_source_code_hash = true` disables Terraform's tracking of source code changes. This is correct behavior because:
1. The module outputs `ignore_source_code_hash` to the `terraform_data.package_filename_for_hash` resource.
2. Without this flag, Terraform would try to detect changes to the image (via SHA256), causing drift when ECR images are updated out-of-band.
3. With the flag, Terraform only cares about the declared `image_uri` in configuration; actual image content changes are ignored.

### Reconciliation Result

**Final Plan**: 0 to add, 0 to change, 0 to destroy ✓

This confirms that the imported Terraform state matches the discovered cloud resources and the current configuration in `environments/sg.tfvars`. No drift or corrections are needed.
