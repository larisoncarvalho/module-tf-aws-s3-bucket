# stulyze-infrastructure

## Description

Manages a CloudFormation stack for the Stulyze app, an Athena primary workgroup, and an Internet Gateway attached to an existing VPC.

## Stack Overview

| Module | Description |
|--------|-------------|
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack |
| `athena_workgroup` | Manages the primary Athena workgroup |
| `internet_gateway` | Manages the Internet Gateway attached to an existing VPC |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | string | AWS region | `"ap-southeast-1"` |
| `cloudformation_stack_name` | string | Name of the CloudFormation stack | `"stulyze-app"` |
| `cloudformation_stack_disable_rollback` | bool | Disable rollback on stack creation failure | `false` |
| `athena_workgroup_name` | string | Name of the Athena workgroup | `"primary"` |
| `athena_workgroup_state` | string | State of the workgroup (DISABLED or ENABLED) | `"ENABLED"` |
| `athena_workgroup_enforce_workgroup_configuration` | bool | Whether workgroup settings override client-side settings | `false` |
| `athena_workgroup_publish_cloudwatch_metrics_enabled` | bool | Whether CloudWatch metrics are enabled | `true` |
| `athena_workgroup_requester_pays_enabled` | bool | Whether Requester Pays buckets are allowed | `false` |
| `athena_workgroup_selected_engine_version` | string | Requested Athena engine version | `"AUTO"` |
| `internet_gateway_vpc_id` | string | VPC ID to attach the Internet Gateway to | `"vpc-05fed6e9ac0f64a6e"` |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `cloudformation_stack_id` | A unique identifier of the CloudFormation stack |
| `athena_workgroup_id` | The ID of the Athena workgroup |
| `athena_workgroup_arn` | The ARN of the Athena workgroup |
| `internet_gateway_id` | The ID of the Internet Gateway |
| `internet_gateway_arn` | The ARN of the Internet Gateway |

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