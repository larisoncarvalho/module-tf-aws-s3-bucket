# taher-private-runner-asg

## Description

Auto Scaling Group for taher-private-runner using a launch template. This stack manages the lifecycle of an AWS Auto Scaling Group configured with a launch template, enabling automatic scaling of EC2 instances within the specified VPC subnets.

## Module Overview

| Module | Description | Source |
|--------|-------------|--------|
| `autoscaling_group` | Manages the taher-private-runner Auto Scaling Group | `./modules/autoscaling_group` |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region where resources will be managed | `"eu-central-1"` |
| `name` | `string` | Name of the Auto Scaling Group | `"taher-private-runner"` |
| `max_size` | `number` | Maximum size of the Auto Scaling Group | `5` |
| `min_size` | `number` | Minimum size of the Auto Scaling Group | `0` |
| `desired_capacity` | `number` | Desired number of EC2 instances in the Auto Scaling Group | `0` |
| `default_cooldown` | `number` | Amount of time in seconds after a scaling activity completes before another can start | `300` |
| `health_check_grace_period` | `number` | Time in seconds after instance comes into service before checking health | `300` |
| `health_check_type` | `string` | Health check type, either EC2 or ELB | `"EC2"` |
| `protect_from_scale_in` | `bool` | Whether newly launched instances are protected from termination on scale in | `false` |
| `service_linked_role_arn` | `string` | ARN of the service-linked role used by the ASG | (see tfvars) |
| `termination_policies` | `list(string)` | List of policies to determine how instances are terminated | `["Default"]` |
| `vpc_zone_identifier` | `list(string)` | List of subnet IDs to launch resources in | (see tfvars) |
| `launch_template_id` | `string` | ID of the launch template to use | `"lt-00ead3b0f34510223"` |
| `launch_template_version` | `string` | Version of the launch template to use | `"$Latest"` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `autoscaling_group_id` | ID of the Auto Scaling Group |
| `autoscaling_group_arn` | ARN of the Auto Scaling Group |
| `autoscaling_group_name` | Name of the Auto Scaling Group |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

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

## Notes

- The `launch_template_version` is set to `$Latest`, which always uses the most recent version of the launch template.
- The ASG is configured with a single subnet (`subnet-02aff1dbfda577bb1`) in `eu-central-1`.
- The `termination_policies` is set to `["Default"]`, using AWS default termination logic.
- After importing, run `terraform plan` to verify zero drift before applying any changes.