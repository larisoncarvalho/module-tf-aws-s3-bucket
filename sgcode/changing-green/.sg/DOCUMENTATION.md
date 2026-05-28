# aws-infrastructure-eu-central-1

## Description

Mixed AWS infrastructure stack including API Gateway, Athena workgroup, Auto Scaling group, CloudFormation stacks, and AWS Config rules in eu-central-1.

## Module Overview

| Module | Description |
|--------|-------------|
| `apigatewayv2_api` | Manages the HTTP API Gateway v2 API |
| `athena_workgroup` | Manages the Athena workgroup |
| `autoscaling_group` | Manages the Auto Scaling group for the private runner |
| `cloudformation_stack` | Manages CloudFormation stacks |
| `config_config_rule` | Manages AWS Config rules |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | string | AWS region |
| `api_gateway_name` | string | Name of the API Gateway v2 API |
| `api_gateway_protocol_type` | string | API protocol type (HTTP or WEBSOCKET) |
| `api_gateway_api_key_selection_expression` | string | API key selection expression |
| `api_gateway_route_selection_expression` | string | Route selection expression |
| `api_gateway_disable_execute_api_endpoint` | bool | Whether to disable the default execute-api endpoint |
| `athena_workgroup_name` | string | Name of the Athena workgroup |
| `athena_workgroup_state` | string | State of the workgroup (ENABLED or DISABLED) |
| `athena_enforce_workgroup_configuration` | bool | Whether workgroup settings override client-side settings |
| `athena_publish_cloudwatch_metrics_enabled` | bool | Whether CloudWatch metrics are enabled for the workgroup |
| `athena_requester_pays_enabled` | bool | Whether requester pays is enabled |
| `athena_selected_engine_version` | string | Selected Athena engine version |
| `asg_name` | string | Name of the Auto Scaling group |
| `asg_max_size` | number | Maximum size of the Auto Scaling group |
| `asg_min_size` | number | Minimum size of the Auto Scaling group |
| `asg_desired_capacity` | number | Desired number of EC2 instances in the group |
| `asg_health_check_grace_period` | number | Time in seconds after instance launch before health checks begin |
| `asg_health_check_type` | string | Health check type (EC2 or ELB) |
| `asg_default_cooldown` | number | Default cooldown period in seconds |
| `asg_default_instance_warmup` | number | Default instance warmup period in seconds |
| `asg_protect_from_scale_in` | bool | Whether newly launched instances are protected from scale-in |
| `asg_capacity_rebalance` | bool | Whether capacity rebalance is enabled |
| `asg_metrics_granularity` | string | Granularity for metrics collection |
| `asg_service_linked_role_arn` | string | ARN of the service-linked role for the ASG |
| `asg_vpc_zone_identifier` | list(string) | List of subnet IDs for the ASG |
| `asg_launch_template_id` | string | ID of the launch template |
| `asg_launch_template_name` | string | Name of the launch template |
| `asg_launch_template_version` | string | Version of the launch template |
| `asg_capacity_distribution_strategy` | string | Strategy for distributing capacity across AZs |
| `asg_capacity_reservation_preference` | string | Capacity reservation preference |
| `cloudformation_stacks` | map(object) | Map of CloudFormation stacks to manage |
| `config_rules` | map(object) | Map of AWS Config rules to manage |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `api_gateway_id` | ID of the API Gateway v2 API |
| `api_gateway_endpoint` | Endpoint of the API Gateway v2 API |
| `athena_workgroup_id` | ID of the Athena workgroup |
| `autoscaling_group_arn` | ARN of the Auto Scaling group |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
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