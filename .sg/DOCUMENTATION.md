# taher-private-runner-infrastructure

EC2 instance infrastructure for private runner with key pair

## Overview

This Terraform stack manages a complete EC2 instance setup including:
- SSH key pair for secure access
- EC2 instance with custom configuration

## Modules

### key_pair
Manages SSH key pair for instance access

**Resources:**
- `aws_key_pair.this`

### instance
Manages EC2 instance

**Resources:**
- `aws_instance.this`

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| ami_id | string | AMI ID for the EC2 instance | ami-03250b0e01c28d196 |
| subnet_id | string | Subnet ID for instance placement | subnet-072669658da496c4a |
| security_group_ids | list(string) | Security group IDs for the instance | ["sg-092a5ff991a0802bc"] |
| key_pair_public_key | string | Public key material for SSH key pair | "" |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| instance_private_ip | Private IP address of the instance |
| key_pair_name | Name of the SSH key pair |
| key_pair_fingerprint | Fingerprint of the SSH key pair |

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

## Notes

- The instance is configured with IMDSv2 (metadata tokens required)
- Root volume is set to delete on termination
- Instance uses t2.medium type with 2 CPU cores
- Private IP is statically assigned to 10.0.0.52