# EC2 Instance Infrastructure

## Overview

This Terraform stack manages an EC2 instance with comprehensive network configuration and block device mappings in the eu-central-1 region.

## Stack Description

EC2 instance with network configuration and block device mappings

## Modules

### instance

Manages EC2 instance with associated network interface and EBS volume

**Resources:**
- `aws_instance.this` - EC2 instance with full configuration including metadata options, enclave settings, and capacity reservations

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| subnet_id | string | Subnet ID for the instance | "subnet-072669658da496c4a" |
| security_group_ids | list(string) | Security group IDs to attach | ["sg-0d5bf7aeaa53bfb92"] |
| root_volume_type | string | Root volume type | "gp2" |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| private_ip | Private IP address of the instance |

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

## Instance Configuration

The EC2 instance is configured with:
- **AMI**: ami-03074cc1b166e8691
- **Instance Type**: t2.medium
- **Availability Zone**: eu-central-1a
- **Private IP**: 10.0.0.37
- **Key Pair**: taher-private-runner
- **Metadata Service**: IMDSv2 required (http_tokens = required)
- **Root Volume**: gp2 type with delete on termination enabled

## Security Features

- Source/destination checking enabled
- Metadata service configured with IMDSv2 requirement
- HTTP PUT response hop limit set to 2
- IPv6 metadata protocol disabled
- Instance metadata tags disabled

## Notes

- This configuration imports an existing EC2 instance (i-000e597ea8aa8260b)
- EBS optimization is disabled
- Detailed monitoring is disabled
- Hibernation is not enabled
- Nitro Enclaves are not enabled
- Capacity reservation preference set to "open"