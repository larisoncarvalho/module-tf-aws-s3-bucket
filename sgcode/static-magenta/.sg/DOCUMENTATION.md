# taher-private-runner-infrastructure

EC2 instance with key pair and network interface

## Overview

This Terraform stack manages an EC2 instance with an attached network interface and SSH key pair in the eu-central-1 region.

## Modules

### key_pair

SSH key pair for instance access

**Resources:**
- `aws_key_pair.this`

### instance

EC2 instance with attached network interface

**Resources:**
- `aws_instance.this`
- `aws_network_interface.this`

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| taher_private_runner_public_key | string | Public key material for taher-private-runner key pair | "" |
| subnet_id | string | Subnet ID for the instance | "subnet-072669658da496c4a" |
| security_group_ids | list(string) | Security group IDs | ["sg-092a5ff991a0802bc"] |
| root_volume_type | string | Root volume type | "gp2" |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| instance_private_ip | Private IP address of the instance |
| key_pair_name | Name of the key pair |
| network_interface_id | ID of the network interface |

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

- The instance uses AMI `ami-0b74f796d330ab49c` (Amazon Linux 2)
- Instance type: t2.medium
- Private IP: 10.0.0.41
- Metadata service requires IMDSv2 tokens
- Root volume is deleted on instance termination