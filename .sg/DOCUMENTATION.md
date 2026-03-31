# neha-private-runner-infrastructure

Auto Scaling Group with Launch Template for private runner instances

## Overview

This Terraform stack manages infrastructure for private runner instances in AWS, consisting of:

- **launch_template**: EC2 launch template for auto scaling group instances
- **autoscaling_group**: Auto scaling group for private runner instances

## Architecture

The stack creates an auto scaling group that uses a launch template to provision EC2 instances. The ASG is configured with health checks, termination policies, and scaling parameters to maintain the desired number of runner instances.

## Modules

### launch_template

Manages EC2 launch template for auto scaling group instances.

**Resources:**
- `aws_launch_template.this`

**Inputs:**
| Name | Type | Description |
|------|------|-------------|
| launch_template_name | string | Name of the launch template |

**Outputs:**
| Name | Description |
|------|-------------|
| id | ID of the launch template |
| latest_version | Latest version of the launch template |

### autoscaling_group

Manages auto scaling group for private runner instances.

**Resources:**
- `aws_autoscaling_group.this`

**Inputs:**
| Name | Type | Description |
|------|------|-------------|
| name | string | Name of the auto scaling group |
| availability_zones | list(string) | List of availability zones for the auto scaling group |
| default_cooldown | number | Default cooldown period in seconds |
| desired_capacity | number | Desired number of instances |
| health_check_grace_period | number | Health check grace period in seconds |
| health_check_type | string | Type of health check (EC2 or ELB) |
| max_size | number | Maximum number of instances |
| min_size | number | Minimum number of instances |
| new_instances_protected_from_scale_in | bool | Whether new instances are protected from scale in |
| service_linked_role_arn | string | ARN of the service linked role for auto scaling |
| termination_policies | list(string) | List of termination policies |
| vpc_zone_identifier | string | Subnet ID for the auto scaling group |
| launch_template_id | string | ID of the launch template |
| launch_template_version | string | Version of the launch template to use |

**Outputs:**
| Name | Description |
|------|-------------|
| id | ID of the auto scaling group |
| arn | ARN of the auto scaling group |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| service_linked_role_arn | string | ARN of the service linked role for auto scaling | arn:aws:iam::790543352839:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling |
| subnet_id | string | Subnet ID for the auto scaling group | subnet-0b77c0d76befaf70d |

## Outputs

| Name | Description |
|------|-------------|
| launch_template_id | ID of the launch template |
| autoscaling_group_id | ID of the auto scaling group |
| autoscaling_group_arn | ARN of the auto scaling group |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- This configuration imports existing AWS resources
- After import, `terraform plan` should show no changes (zero drift)
- The auto scaling group is configured with a desired capacity of 1, min 1, max 3
- Health checks use EC2 type with a 300-second grace period
- The launch template version is set to "$Latest" for automatic updates