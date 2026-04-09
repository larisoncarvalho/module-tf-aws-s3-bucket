# autoscaling-infrastructure

Auto Scaling Group for private runner instances

## Overview

This stack manages an AWS Auto Scaling Group for runner instances in the eu-central-1 region.

## Modules

### autoscaling_group

Manages Auto Scaling Group for runner instances

**Resources:**
- `aws_autoscaling_group.this` - Auto Scaling Group resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| launch_template_id | string | ID of the launch template | lt-0214ccad66ff870eb |
| subnet_id | string | Subnet ID for the Auto Scaling Group | subnet-0b77c0d76befaf70d |

## Outputs

| Name | Description |
|------|-------------|
| asg_id | ID of the Auto Scaling Group |
| asg_arn | ARN of the Auto Scaling Group |
| asg_name | Name of the Auto Scaling Group |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Module Details

### runner_asg

Provisions an Auto Scaling Group named "SG_RUNNER_new-private-runner-asg" with:
- Availability Zone: eu-central-1a
- Capacity: 1 desired, 1 minimum, 5 maximum
- Health check: EC2 type with 300s grace period
- Cooldown: 300 seconds
- Launch template: Uses provided template ID with $Latest version