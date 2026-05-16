# taher-private-runner-infrastructure

EC2 instance infrastructure for private runner with network interface and key pair

## Overview

This Terraform stack manages a complete EC2 instance infrastructure including:
- EC2 instance with customized compute and metadata settings
- SSH key pair for instance access
- Network interface attached to the instance

## Modules

### instance
Manages EC2 instance with attached network interface

**Resources:**
- `aws_instance.this`

### key_pair
Manages SSH key pair for instance access

**Resources:**
- `aws_key_pair.this`

### network_interface
Manages network interface attached to EC2 instance

**Resources:**
- `aws_network_interface.this`

## Variables

| Name | Type | Default | Description |
|------|------|---------|-------------|
| region | string | "eu-central-1" | AWS region |
| ami_id | string | "ami-03250b0e01c28d196" | AMI ID for the instance |
| subnet_id | string | "subnet-072669658da496c4a" | Subnet ID |
| security_group_ids | list(string) | ["sg-092a5ff991a0802bc"] | Security group IDs |
| root_volume_type | string | "gp2" | Root volume type |
| key_pair_public_key | string | - | Public key material for SSH key pair |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | Instance ID |
| instance_private_ip | Instance private IP |
| key_pair_name | Key pair name |
| network_interface_id | Network interface ID |

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Import existing resources:
```bash
chmod +x imports.sh
./imports.sh
```

3. Review the plan:
```bash
terraform plan -var-file=environments/terraform.tfvars
```

4. Apply the configuration:
```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- The instance is configured with IMDSv2 required for enhanced security
- Source/destination checking is enabled on both instance and network interface
- Root volume is set to delete on termination
- Instance uses 2 CPU cores with 1 thread per core