# taher-private-runner-infrastructure

EC2 instance with key pair and network interface

## Overview

This stack provisions an EC2 instance with an attached key pair in the eu-central-1 region. The infrastructure includes:

- **instance**: EC2 instance with attached network interface

## Modules

### instance

EC2 instance with attached network interface

**Resources:**
- `aws_instance.this`: EC2 instance
- `aws_key_pair.this`: SSH key pair

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| ami_id | string | AMI ID for the instance | "ami-0b74f796d330ab49c" |
| public_key | string | Public key material for the key pair | (sensitive) |
| subnet_id | string | Subnet ID for the instance | "subnet-072669658da496c4a" |
| security_group_ids | list(string) | Security group IDs | ["sg-092a5ff991a0802bc"] |
| root_volume_type | string | Root volume type | - |
| root_volume_size | number | Root volume size in GB | - |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip | Private IP address of the instance |
| key_pair_name | Key pair name |
| network_interface_id | Primary network interface ID |

## Usage

### Initialize

```bash
tofu init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh tofu
```

### Plan

```bash
tofu plan -var-file environments/sg.tfvars
```

### Apply

```bash
tofu apply -var-file environments/sg.tfvars
```

## Notes

- The public_key variable must be provided at runtime (not in tfvars due to sensitivity)
- The instance is configured with IMDSv2 required for enhanced security
- Root volume is set to delete on termination