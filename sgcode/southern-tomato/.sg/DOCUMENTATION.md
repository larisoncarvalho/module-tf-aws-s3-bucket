# taher-private-runner-infrastructure

EC2 instance infrastructure for private runner with key pair

## Overview

This stack manages a complete EC2 instance setup including:
- SSH key pair for instance access
- EC2 instance with custom configuration

## Modules

### instance
Manages EC2 instance

**Resources:**
- `aws_instance.this`

### key_pair
Manages SSH key pair for instance access

**Resources:**
- `aws_key_pair.this`

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| ami_id | string | AMI ID for the instance | ami-03250b0e01c28d196 |
| subnet_id | string | Subnet ID | subnet-072669658da496c4a |
| security_group_ids | list(string) | Security group IDs | ["sg-092a5ff991a0802bc"] |
| root_volume_type | string | Root volume type | gp2 |
| key_pair_public_key | string | Public key material for SSH key pair | (required) |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | Instance ID |
| instance_private_ip | Instance private IP |
| key_pair_name | Key pair name |

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

## Configuration

The stack is configured for the eu-central-1 region with:
- Instance type: t2.medium
- Availability zone: eu-central-1a
- Private IP: 10.0.0.52
- Metadata service: IMDSv2 required
- CPU: 2 cores, 1 thread per core