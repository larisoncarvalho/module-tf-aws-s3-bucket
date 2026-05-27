# stulyze-infrastructure

## Description

Manages a CloudFormation stack for the Stulyze application and an Athena workgroup in ap-southeast-1.

## Stack Overview

| Module | Description |
|--------|-------------|
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack |
| `athena_workgroup` | Manages the primary Athena workgroup |

## Modules

### cloudformation_stack (`./modules/cloudformation_stack`)

Manages the `stulyze-app` AWS CloudFormation stack.

**Resources:**
- `aws_cloudformation_stack.this` — The CloudFormation stack

### athena_workgroup (`./modules/athena_workgroup`)

Manages the `primary` Athena workgroup with engine versioning and CloudWatch metrics configuration.

**Resources:**
- `aws_athena_workgroup.this` — The Athena workgroup

## Variables Reference

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `region` | `string` | `"ap-southeast-1"` | AWS region |
| `cloudformation_stack_name` | `string` | `"stulyze-app"` | Name of the CloudFormation stack |
| `cloudformation_stack_disable_rollback` | `bool` | `false` | Disable rollback on stack creation failure |
| `athena_workgroup_name` | `string` | `"primary"` | Name of the Athena workgroup |
| `athena_workgroup_state` | `string` | `"ENABLED"` | State of the workgroup (DISABLED or ENABLED) |
| `athena_workgroup_enforce_workgroup_configuration` | `bool` | `false` | Whether workgroup settings override client-side settings |
| `athena_workgroup_publish_cloudwatch_metrics_enabled` | `bool` | `true` | Whether CloudWatch metrics are enabled |
| `athena_workgroup_requester_pays_enabled` | `bool` | `false` | Whether Requester Pays buckets are allowed |
| `athena_workgroup_selected_engine_version` | `string` | `"AUTO"` | Requested Athena engine version |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `cloudformation_stack_name` | Name of the CloudFormation stack |
| `cloudformation_stack_id` | Unique identifier of the CloudFormation stack |
| `athena_workgroup_name` | Name of the Athena workgroup |
| `athena_workgroup_arn` | ARN of the Athena workgroup |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
./imports.sh terraform
# or for OpenTofu:
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```