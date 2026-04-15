# taher-private-runner-infrastructure

EC2 instance infrastructure for private runner with network interface and key pair

## Overview

This stack manages an EC2 instance with an attached network interface and SSH key pair in the eu-central-1 region.

## Modules

### instance

Manages EC2 instance with attached network interface

**Resources:**
- `aws_instance.this` - EC2 instance with specified configuration
- `data.aws_key_pair.this` - Reference to existing SSH key pair

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| ami_id | string | AMI ID for the instance | "ami-03250b0e01c28d196" |
| subnet_id | string | Subnet ID for the instance | "subnet-072669658da496c4a" |
| security_group_ids | list(string) | Security group IDs to attach | ["sg-092a5ff991a0802bc"] |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| instance_arn | ARN of the EC2 instance |
| key_pair_id | ID of the key pair |
| primary_network_interface_id | ID of the primary network interface |

## Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import existing resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh terraform
   ```

3. **Review the plan:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

## Notes

- The instance is configured with IMDSv2 (metadata tokens required)
- Source/destination checking is enabled
- Root volume is deleted on instance termination
- The instance uses a t2.medium instance type with 2 CPU cores