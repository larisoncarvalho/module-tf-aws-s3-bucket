# ECS Autoscaling Infrastructure

## Overview

This stack manages an ECS autoscaling group with a service-linked IAM role for AWS Auto Scaling. It provisions the necessary infrastructure to automatically scale ECS instances based on demand.

## Architecture

The stack consists of two main modules:

1. **autoscaling_group**: Manages the AWS Auto Scaling group for ECS instances
2. **iam_role**: Manages the IAM service-linked role required for Auto Scaling operations

## Modules

### autoscaling_group

Manages the ECS instances autoscaling group with configurable capacity, health checks, and termination policies.

**Resources:**
- `aws_autoscaling_group.this`: The autoscaling group resource

### iam_role

Manages the IAM service-linked role for Auto Scaling with attached policies.

**Resources:**
- `aws_iam_role.this`: The IAM role resource
- `aws_iam_role_policy_attachment.this`: Policy attachments for the role

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| subnet_id | string | Subnet ID for the autoscaling group | subnet-072669658da496c4a |
| launch_template_id | string | Launch template ID | lt-0f212ff506c4e1680 |
| autoscaling_service_role_policy_arn | string | ARN of the autoscaling service role policy | arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy |

## Outputs

| Name | Description |
|------|-------------|
| autoscaling_group_id | ID of the autoscaling group |
| autoscaling_group_arn | ARN of the autoscaling group |
| iam_role_arn | ARN of the IAM role |

## Usage

### Initialize

```bash
tofu init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh tofu
```

### Plan

```bash
tofu plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
tofu apply -var-file=environments/terraform.tfvars
```

## Configuration

The autoscaling group is configured with:
- Desired capacity: 1 instance
- Min size: 0 instances
- Max size: 1 instance
- Health check type: EC2
- Health check grace period: 150 seconds
- Default cooldown: 300 seconds
- Comprehensive CloudWatch metrics enabled
- Default termination policy

The IAM role provides the necessary permissions for Auto Scaling to manage EC2 instances, ELB, and CloudWatch on your behalf.

## Notes

- The service-linked role is a special type of IAM role that is linked directly to an AWS service
- The autoscaling group uses a launch template to define instance configuration
- All instances are tagged with Resource-Type=nonprod and Name=ecs-instances-admin-workflow-qa