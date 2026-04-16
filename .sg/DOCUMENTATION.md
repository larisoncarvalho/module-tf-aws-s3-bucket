# ap-southeast-1-mixed-infrastructure

## Description

Athena workgroup, CloudFormation stack, internet gateway, network ACL, and route table in ap-southeast-1.

## Module Overview

| Module | Description | Resource Type |
|--------|-------------|---------------|
| `athena_workgroup` | Manages the primary Athena workgroup | `aws_athena_workgroup` |
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack | `aws_cloudformation_stack` |
| `internet_gateway` | Manages the internet gateway attached to the VPC | `aws_internet_gateway` |
| `network_acl` | Manages the default network ACL for the VPC | `aws_network_acl` |
| `route_table` | Manages the main route table for the VPC | `aws_route_table` |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | `string` | AWS region | `"ap-southeast-1"` |
| `athena_workgroup_name` | `string` | Name of the Athena workgroup | `"primary"` |
| `athena_workgroup_state` | `string` | State of the Athena workgroup (ENABLED or DISABLED) | `"ENABLED"` |
| `athena_enforce_workgroup_configuration` | `bool` | Whether workgroup settings override client-side settings | `false` |
| `athena_publish_cloudwatch_metrics_enabled` | `bool` | Whether CloudWatch metrics are enabled for the Athena workgroup | `true` |
| `athena_requester_pays_enabled` | `bool` | Whether requester pays is enabled for the Athena workgroup | `false` |
| `athena_selected_engine_version` | `string` | Requested Athena engine version | `"AUTO"` |
| `cloudformation_stack_name` | `string` | Name of the CloudFormation stack | `"stulyze-app"` |
| `cloudformation_disable_rollback` | `bool` | Whether to disable rollback on stack creation failure | `false` |
| `internet_gateway_vpc_id` | `string` | The VPC ID to attach the internet gateway to | `"vpc-05fed6e9ac0f64a6e"` |
| `network_acl_vpc_id` | `string` | The VPC ID to associate the network ACL with | `"vpc-05fed6e9ac0f64a6e"` |
| `network_acl_subnet_ids` | `list(string)` | List of subnet IDs to apply the network ACL to | see tfvars |
| `route_table_vpc_id` | `string` | The VPC ID for the route table | `"vpc-05fed6e9ac0f64a6e"` |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `athena_workgroup_arn` | ARN of the Athena workgroup |
| `athena_workgroup_id` | ID of the Athena workgroup |
| `cloudformation_stack_id` | Unique identifier of the CloudFormation stack |
| `cloudformation_stack_outputs` | Map of outputs from the CloudFormation stack |
| `internet_gateway_id` | ID of the internet gateway |
| `internet_gateway_arn` | ARN of the internet gateway |
| `network_acl_id` | ID of the network ACL |
| `network_acl_arn` | ARN of the network ACL |
| `route_table_id` | ID of the route table |
| `route_table_arn` | ARN of the route table |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

```sh
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

## Cross-Module Wiring

The `route_table` module receives the internet gateway ID from the `internet_gateway` module output:

```
module.internet_gateway.id → module.route_table.internet_gateway_id
```

This ensures the route table's default route (`0.0.0.0/0`) always references the correct internet gateway without hardcoding any resource IDs.