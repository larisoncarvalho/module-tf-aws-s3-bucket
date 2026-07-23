# taher-private-runner-infrastructure

EC2 instance with network interface and key pair for private runner

## Overview

This stack provisions an EC2 instance with an attached network interface and SSH key pair for a private runner in the eu-central-1 region.

## Modules

### instance

EC2 instance with attached network interface

**Resources:**
- `aws_instance.this` - EC2 instance with specified configuration
- `aws_key_pair.this` - SSH key pair for instance access
- `aws_network_interface.this` - Network interface attached to the instance

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| ami_id | string | AMI ID for the instance | ami-03250b0e01c28d196 |
| subnet_id | string | Subnet ID for the instance | subnet-072669658da496c4a |
| security_group_ids | list(string) | Security group IDs | ["sg-092a5ff991a0802bc"] |
| root_volume_type | string | Root volume type | gp2 |
| public_key | string | Public key material for key pair | "" |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| instance_private_ip | EC2 instance private IP address |
| key_pair_name | Key pair name |
| network_interface_id | Network interface ID |

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
- Root volume is set to delete on termination
- The instance uses a t2.medium instance type in eu-central-1a
- Private IP is statically assigned to 10.0.0.52