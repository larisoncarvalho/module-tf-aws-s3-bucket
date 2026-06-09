# ap-southeast-1-infrastructure

## Description

Manages an Athena workgroup, a CloudFormation stack, and an Internet Gateway in ap-southeast-1.

## Module Overview

| Module | Description | Resource Type |
|--------|-------------|---------------|
| `athena_workgroup` | Manages the primary Athena workgroup | `aws_athena_workgroup` |
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack | `aws_cloudformation_stack` |
| `internet_gateway` | Manages the Internet Gateway attached to a VPC | `aws_internet_gateway` |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | `string` | AWS region for the provider | `"ap-southeast-1"` |
| `athena_workgroup_name` | `string` | Name of the Athena workgroup | `"primary"` |
| `athena_workgroup_state` | `string` | State of the Athena workgroup (ENABLED or DISABLED) | `"ENABLED"` |
| `athena_workgroup_enforce_workgroup_configuration` | `bool` | Whether workgroup settings override client-side settings | `false` |
| `athena_workgroup_publish_cloudwatch_metrics_enabled` | `bool` | Whether CloudWatch metrics are enabled for the Athena workgroup | `true` |
| `athena_workgroup_requester_pays_enabled` | `bool` | Whether requester pays is enabled for the Athena workgroup | `false` |
| `athena_workgroup_selected_engine_version` | `string` | Requested Athena engine version | `"AUTO"` |
| `cloudformation_stack_name` | `string` | Name of the CloudFormation stack | `"stulyze-app"` |
| `cloudformation_stack_disable_rollback` | `bool` | Whether to disable rollback on stack creation failure | `false` |
| `internet_gateway_vpc_id` | `string` | The VPC ID to attach the Internet Gateway to | `"vpc-05fed6e9ac0f64a6e"` |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `athena_workgroup_arn` | ARN of the Athena workgroup |
| `athena_workgroup_id` | ID of the Athena workgroup |
| `cloudformation_stack_id` | Unique identifier of the CloudFormation stack |
| `cloudformation_stack_outputs` | Map of outputs from the CloudFormation stack |
| `internet_gateway_id` | ID of the Internet Gateway |
| `internet_gateway_arn` | ARN of the Internet Gateway |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
./imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```