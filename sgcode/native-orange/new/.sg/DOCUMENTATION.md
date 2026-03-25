# EC2 Instance Infrastructure

## Overview

This Terraform stack manages EC2 instance infrastructure with networking, storage, and security group configuration in AWS region `eu-central-1`.

## Architecture

The stack consists of five modules:

1. **vpc**: Virtual Private Cloud with IPv4 and IPv6 CIDR blocks
2. **subnet**: VPC subnet with IPv4 and IPv6 addressing
3. **security_group**: Security group with ingress and egress rules
4. **key_pair**: EC2 SSH key pair
5. **instance**: EC2 instance with attached network interface and EBS volume

## Module Details

### VPC Module

Creates a VPC with DNS support and configurable tenancy.

**Resources:**
- `aws_vpc.this`

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| cidr_block | string | Primary IPv4 CIDR block for the VPC |
| instance_tenancy | string | Tenancy option for instances launched into the VPC |
| tags | map(string) | Resource tags |

**Outputs:**
| Output | Description |
|--------|-------------|
| vpc_id | VPC ID |
| vpc_cidr_block | VPC CIDR block |

### Subnet Module

Creates a subnet within the VPC with IPv4 and IPv6 addressing.

**Resources:**
- `aws_subnet.this`

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| vpc_id | string | VPC ID where subnet will be created |
| cidr_block | string | IPv4 CIDR block for the subnet |
| availability_zone | string | Availability zone for the subnet |
| map_public_ip_on_launch | bool | Whether to assign public IP on instance launch |
| assign_ipv6_address_on_creation | bool | Whether to assign IPv6 address on creation |
| ipv6_cidr_block | string | IPv6 CIDR block for the subnet |
| tags | map(string) | Resource tags |

**Outputs:**
| Output | Description |
|--------|-------------|
| subnet_id | Subnet ID |

### Security Group Module

Creates a security group with configurable ingress and egress rules.

**Resources:**
- `aws_security_group.this`
- `aws_vpc_security_group_ingress_rule.this` (for_each)
- `aws_vpc_security_group_egress_rule.this` (for_each)

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| name | string | Name of the security group |
| description | string | Security group description |
| vpc_id | string | VPC ID where security group will be created |
| ingress_rules | map(object) | Ingress rules to create |
| egress_rules | map(object) | Egress rules to create |

**Outputs:**
| Output | Description |
|--------|-------------|
| security_group_id | Security group ID |

### Key Pair Module

Creates an EC2 SSH key pair.

**Resources:**
- `aws_key_pair.this`

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| key_name | string | Name of the key pair |
| public_key | string | Public key material (sensitive) |

**Outputs:**
| Output | Description |
|--------|-------------|
| key_name | Key pair name |

### Instance Module

Creates an EC2 instance with comprehensive configuration options.

**Resources:**
- `aws_instance.this`

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| ami | string | AMI ID to use for the instance |
| instance_type | string | Instance type |
| availability_zone | string | Availability zone for the instance |
| key_name | string | Key pair name for SSH access |
| subnet_id | string | Subnet ID where instance will be launched |
| vpc_security_group_ids | list(string) | Security group IDs to attach |
| private_ip | string | Private IP address |
| source_dest_check | bool | Whether to enable source/destination checking |
| ebs_optimized | bool | Whether to enable EBS optimization |
| monitoring | bool | Whether to enable detailed monitoring |
| tenancy | string | Tenancy of the instance |
| cpu_core_count | number | Number of CPU cores |
| cpu_threads_per_core | number | Number of threads per CPU core |
| hibernation | bool | Whether hibernation is enabled |
| metadata_http_endpoint | string | Whether the metadata service is available |
| metadata_http_tokens | string | Whether session tokens are required for metadata requests |
| metadata_http_put_response_hop_limit | number | Desired HTTP PUT response hop limit for instance metadata requests |
| metadata_http_protocol_ipv6 | string | Whether IPv6 is enabled for the metadata service |
| metadata_instance_metadata_tags | string | Whether instance tags are available through metadata |
| enclave_enabled | bool | Whether Nitro Enclaves are enabled |
| capacity_reservation_preference | string | Capacity reservation preference |
| root_volume_type | string | Root volume type |
| root_volume_size | number | Root volume size in GB |
| root_volume_iops | number | Root volume IOPS |
| root_volume_throughput | number | Root volume throughput in MB/s |
| root_volume_encrypted | bool | Whether root volume is encrypted |
| root_volume_delete_on_termination | bool | Whether root volume is deleted on instance termination |

**Outputs:**
| Output | Description |
|--------|-------------|
| instance_id | Instance ID |
| private_ip | Instance private IP address |

## Root Variables

| Variable | Type | Description | Required |
|----------|------|-------------|----------|
| region | string | AWS region | Yes |
| key_pair_public_key | string | Public key material for SSH access (sensitive) | Yes |

## Root Outputs

| Output | Description |
|--------|-------------|
| vpc_id | VPC ID |
| subnet_id | Subnet ID |
| security_group_id | Security group ID |
| instance_id | EC2 instance ID |
| instance_private_ip | EC2 instance private IP address |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS provider ~> 5.0
- AWS credentials configured
- SSH public key for EC2 access

### Deployment Steps

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Update Variables:**
   Edit `environments/terraform.tfvars` and replace `PLACEHOLDER_SSH_PUBLIC_KEY` with your actual SSH public key.

3. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

4. **Review Changes:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

5. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Security Notes

- The key pair public key is marked as sensitive
- Security group restricts SSH access to specific CIDR blocks
- Instance metadata service requires session tokens (IMDSv2)
- Root volume is not encrypted by default (matches imported state)

### Network Configuration

- VPC CIDR: 10.0.0.0/24
- Subnet CIDR: 10.0.0.32/27
- IPv6 CIDR: 2a05:d014:190:c620::/64
- Instance Private IP: 10.0.0.37
- No public IP assignment

### Security Group Rules

**Ingress:**
- SSH (port 22) from 10.0.0.0/27
- SSH (port 22) from 172.16.0.0/24
- SSH (port 22) from 115.96.62.109/32

**Egress:**
- All traffic to 10.0.0.0/24 (IPv4)
- All traffic to ::/0 (IPv6)

## Maintenance

To update the infrastructure:

1. Modify the relevant module or root configuration
2. Run `terraform plan` to review changes
3. Run `terraform apply` to apply changes

To destroy the infrastructure:

```bash
terraform destroy -var-file=environments/terraform.tfvars
```

**Warning:** This will permanently delete all managed resources.