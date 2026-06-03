# ext-approval-qa-instance

EC2 instance for external approval service in QA environment

## Overview

This Terraform stack manages an EC2 instance configured for the external approval service in the QA environment. The instance is deployed in the eu-central-1 region with specific security, networking, and metadata configurations.

## Modules

### ec2_instance

Manages EC2 instance with associated configuration including:
- Instance type and AMI configuration
- Network settings (VPC, subnet, security groups)
- IAM instance profile
- Metadata service configuration (IMDSv2 required)
- Root volume configuration
- CPU and capacity reservation settings
- Resource tagging

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | - |
| subnet_id | string | Subnet ID where instance will be launched | - |
| security_group_ids | list(string) | List of security group IDs | - |
| iam_instance_profile_arn | string | IAM instance profile ARN | - |
| root_volume_type | string | Type of root volume | - |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| private_ip | Private IP address of the instance |
| public_ip | Public IP address of the instance |

## Usage

### Initialize Terraform

```bash
tofu1.11.2 init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

```bash
tofu1.11.2 plan -var-file environments/terraform.tfvars
```

### Apply Configuration

```bash
tofu1.11.2 apply -var-file environments/terraform.tfvars
```

## Instance Configuration

- **AMI**: ami-00266546a4aac405e
- **Instance Type**: t3.micro
- **Availability Zone**: eu-central-1a
- **Public IP**: Enabled
- **IMDSv2**: Required (enforced)
- **Monitoring**: Basic (not detailed)
- **EBS Optimized**: Disabled
- **Root Volume**: gp2, deleted on termination

## Tags

All resources are tagged with:
- Name: ext-approval-qa
- Project: sg-external-approval
- Environment: qa
- ManagedBy: terraform