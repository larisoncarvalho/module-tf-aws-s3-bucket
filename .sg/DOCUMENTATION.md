# autoscaling-infrastructure

Auto Scaling Group with service-linked IAM role

## Overview

This Terraform stack provisions an Auto Scaling Group for ECS instances along with the required IAM service-linked role. The infrastructure is designed to manage EC2 instances in the eu-central-1 region with configurable scaling parameters and health checks.

## Modules

### iam_role

IAM service-linked role for Auto Scaling. Creates the AWS service-linked role that enables Auto Scaling to access AWS services and resources on your behalf.

**Resources:**
- `aws_iam_role.this` - IAM role for Auto Scaling service
- `aws_iam_role_policy_attachment.this` - Policy attachments for the role

### autoscaling_group

Auto Scaling Group for ECS instances. Manages the lifecycle of EC2 instances with configurable scaling policies, health checks, and CloudWatch metrics.

**Resources:**
- `aws_autoscaling_group.this` - Auto Scaling Group configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| subnet_id | string | Subnet ID for the Auto Scaling Group | "subnet-072669658da496c4a" |
| launch_template_id | string | Launch template ID for the Auto Scaling Group | "lt-0f212ff506c4e1680" |

## Outputs

| Name | Description |
|------|-------------|
| iam_role_arn | ARN of the IAM role |
| iam_role_name | Name of the IAM role |
| asg_id | ID of the Auto Scaling Group |
| asg_arn | ARN of the Auto Scaling Group |
| asg_name | Name of the Auto Scaling Group |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Configuration Details

The Auto Scaling Group is configured with:
- Min size: 0, Max size: 1, Desired capacity: 1
- EC2 health checks with 150 second grace period
- Comprehensive CloudWatch metrics enabled
- Service-linked role for Auto Scaling operations
- Launch template version: $Latest
- Availability zone: eu-central-1a

The IAM role provides the necessary permissions for Auto Scaling to manage EC2 instances and related resources through the AutoScalingServiceRolePolicy.