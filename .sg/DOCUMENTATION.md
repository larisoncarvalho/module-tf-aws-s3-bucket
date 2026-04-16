# ap-southeast-1-infrastructure

## Description

Manages Athena workgroup, CloudFormation stack, Internet Gateway, Network ACL, and Route Table in ap-southeast-1.

## Module Overview

| Module | Description | Resource Type |
|--------|-------------|---------------|
| `athena_workgroup` | Manages the primary Athena workgroup | `aws_athena_workgroup` |
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack | `aws_cloudformation_stack` |
| `internet_gateway` | Manages the Internet Gateway attached to the VPC | `aws_internet_gateway` |
| `network_acl` | Manages the default Network ACL for the VPC | `aws_network_acl` |
| `route_table` | Manages the main Route Table for the VPC | `aws_route_table` |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | `string` | AWS region to deploy resources into | — |
| `athena_workgroup_name` | `string` | Name of the Athena workgroup | — |
| `athena_workgroup_state` | `string` | State of the Athena workgroup (ENABLED or DISABLED) | — |
| `athena_enforce_workgroup_configuration` | `bool` | Whether workgroup settings override client-side settings | — |
| `athena_publish_cloudwatch_metrics_enabled` | `bool` | Whether CloudWatch metrics are enabled for the Athena workgroup | — |
| `athena_requester_pays_enabled` | `bool` | Whether requester pays is enabled for the Athena workgroup | — |
| `athena_selected_engine_version` | `string` | Requested Athena engine version | — |
| `cloudformation_stack_name` | `string` | Name of the CloudFormation stack | — |
| `cloudformation_disable_rollback` | `bool` | Whether to disable rollback on stack creation failure | — |
| `vpc_id` | `string` | The VPC ID used by internet gateway, network ACL, and route table | — |
| `network_acl_subnet_ids` | `list(string)` | List of subnet IDs to apply the Network ACL to | — |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `athena_workgroup_arn` | ARN of the Athena workgroup |
| `athena_workgroup_id` | ID of the Athena workgroup |
| `cloudformation_stack_id` | Unique identifier of the CloudFormation stack |
| `cloudformation_stack_outputs` | Map of outputs from the CloudFormation stack |
| `internet_gateway_id` | The ID of the Internet Gateway |
| `network_acl_id` | The ID of the Network ACL |
| `route_table_id` | The ID of the route table |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

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

## Notes

- The `route_table` module receives the Internet Gateway ID as an output from the `internet_gateway` module via cross-module wiring.
- All resources are imported from existing AWS infrastructure — `terraform plan` should show no changes after a successful import.
- The local route (`172.31.0.0/16 → local`) in the route table is adopted/imported and cannot be created fresh by Terraform.