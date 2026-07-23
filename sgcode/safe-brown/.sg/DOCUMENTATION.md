# taher-private-runner-infrastructure

EC2 instance for private runner in eu-central-1

## Overview

This stack manages a single EC2 instance configured as a private runner in the eu-central-1 region. The infrastructure consists of one module that handles the EC2 instance and its configuration.

## Modules

### instance

Manages EC2 instance and its configuration

**Resources:**
- `aws_instance.this` - EC2 instance with custom CPU, metadata, and root volume configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |
| ami_id | string | AMI ID for the instance | - |
| key_name | string | SSH key pair name | - |
| subnet_id | string | Subnet ID where instance will be launched | - |
| security_group_ids | list(string) | List of security group IDs | - |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| private_ip | Private IP address of the instance |
| private_dns | Private DNS name of the instance |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Configuration Details

The EC2 instance is configured with:
- Instance type: t2.medium
- Custom CPU configuration: 2 cores, 1 thread per core
- IMDSv2 required for enhanced security
- EBS optimization disabled
- Detailed monitoring disabled
- Private IP: 10.0.0.52
- Availability zone: eu-central-1a
- Root volume: gp2, deleted on termination