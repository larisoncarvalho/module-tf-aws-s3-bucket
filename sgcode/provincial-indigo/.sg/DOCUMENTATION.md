# taher-private-runner-infrastructure

EC2 instance infrastructure for private runner with key pair and network interface

## Overview

This Terraform stack manages a complete EC2 instance infrastructure for a private runner in the eu-central-1 region. The stack consists of three modules:

1. **key_pair**: Manages the SSH key pair for EC2 instance access
2. **instance**: Provisions and configures the EC2 instance with detailed settings for compute, networking, and metadata
3. **network_interface**: Creates and attaches a network interface to the EC2 instance

## Modules

### key_pair

SSH key pair for EC2 instance access.

**Resources:**
- `aws_key_pair.this`: SSH key pair resource

**Inputs:**
| Name | Type | Description |
|------|------|-------------|
| key_name | string | Name of the SSH key pair |
| public_key | string | Public key material for the key pair |

**Outputs:**
| Name | Description |
|------|-------------|
| key_name | Name of the SSH key pair |
| key_pair_id | ID of the key pair |

### instance

EC2 instance for private runner.

**Resources:**
- `aws_instance.this`: EC2 instance resource

**Inputs:**
| Name | Type | Description |
|------|------|-------------|
| ami_id | string | AMI ID for the instance |
| instance_type | string | EC2 instance type |
| availability_zone | string | Availability zone for the instance |
| key_name | string | SSH key pair name |
| subnet_id | string | Subnet ID for the instance |
| security_group_ids | list(string) | Security group IDs for the instance |
| private_ip | string | Private IP address for the instance |
| source_dest_check | bool | Enable source/destination checking |
| ebs_optimized | bool | Enable EBS optimization |
| monitoring | bool | Enable detailed monitoring |
| tenancy | string | Instance tenancy |
| hibernation | bool | Enable hibernation |
| enclave_enabled | bool | Enable AWS Nitro Enclaves |
| metadata_http_endpoint | string | Metadata service HTTP endpoint state |
| metadata_http_tokens | string | Metadata service HTTP tokens requirement |
| metadata_hop_limit | number | Metadata service HTTP PUT response hop limit |
| metadata_http_protocol_ipv6 | string | Metadata service IPv6 endpoint state |
| metadata_instance_tags | string | Metadata service instance tags access |
| capacity_reservation_preference | string | Capacity reservation preference |
| cpu_core_count | number | Number of CPU cores |
| cpu_threads_per_core | number | Number of threads per CPU core |
| root_delete_on_termination | bool | Delete root volume on instance termination |
| tags | map(string) | Resource tags |

**Outputs:**
| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| private_ip | Private IP address of the instance |
| availability_zone | Availability zone of the instance |

### network_interface

Network interface attached to EC2 instance.

**Resources:**
- `aws_network_interface.this`: Network interface resource

**Inputs:**
| Name | Type | Description |
|------|------|-------------|
| subnet_id | string | Subnet ID for the network interface |
| private_ips | list(string) | Private IP addresses for the network interface |
| security_group_ids | list(string) | Security group IDs for the network interface |
| source_dest_check | bool | Enable source/destination checking |
| instance_id | string | Instance ID to attach the network interface to |
| device_index | number | Device index for the network interface attachment |

**Outputs:**
| Name | Description |
|------|-------------|
| network_interface_id | ID of the network interface |
| mac_address | MAC address of the network interface |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | eu-central-1 |
| ami_id | string | AMI ID for the EC2 instance | ami-03250b0e01c28d196 |
| subnet_id | string | Subnet ID for the instance and network interface | subnet-072669658da496c4a |
| security_group_ids | list(string) | Security group IDs for the instance and network interface | ["sg-092a5ff991a0802bc"] |
| key_pair_public_key | string | Public key material for the SSH key pair | "" (sensitive) |

## Root Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| key_pair_name | Name of the SSH key pair |
| network_interface_id | ID of the network interface |

## Usage

### Prerequisites

- Terraform/OpenTofu installed
- AWS credentials configured
- Existing VPC, subnet, and security group resources

### Deployment Steps

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review Changes:**
   ```bash
   terraform plan -var-file environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file environments/terraform.tfvars
   ```

### Configuration

Edit `environments/terraform.tfvars` to customize:
- `key_pair_public_key`: Add your SSH public key material
- Other variables as needed for your environment

### Important Notes

- The instance is configured with IMDSv2 (metadata tokens required) for enhanced security
- Source/destination checking is enabled on both the instance and network interface
- The root EBS volume is set to delete on instance termination
- Detailed monitoring is disabled by default
- The instance uses a t2.medium instance type with 2 CPU cores and 1 thread per core