# EC2 Instance Infrastructure

## Overview

This Terraform stack manages EC2 instance infrastructure with network configuration in the eu-central-1 region.

## Modules

### ec2_instance

Manages EC2 instance configuration with comprehensive settings including:
- Instance sizing and placement
- Network configuration
- Storage settings
- Metadata service configuration
- CPU and capacity reservation options

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| subnet_id | string | Subnet ID for the instance | subnet-072669658da496c4a |
| security_group_ids | list(string) | Security group IDs to attach | ["sg-092a5ff991a0802bc"] |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip | Private IP address of the instance |

## Module: ec2_instance

### Variables

| Name | Type | Description |
|------|------|-------------|
| ami_id | string | AMI ID for the instance |
| instance_type | string | EC2 instance type |
| availability_zone | string | Availability zone for the instance |
| key_name | string | SSH key pair name |
| subnet_id | string | Subnet ID for the instance |
| security_group_ids | list(string) | Security group IDs to attach |
| private_ip | string | Private IP address |
| source_dest_check | bool | Enable source/destination checking |
| ebs_optimized | bool | Enable EBS optimization |
| monitoring | bool | Enable detailed monitoring |
| tenancy | string | Instance tenancy |
| root_volume_type | string | Root volume type |
| root_delete_on_termination | bool | Delete root volume on termination |
| metadata_http_endpoint | string | Metadata service HTTP endpoint state |
| metadata_http_tokens | string | Metadata service HTTP tokens requirement |
| metadata_http_put_response_hop_limit | number | Metadata service HTTP PUT response hop limit |
| metadata_http_protocol_ipv6 | string | Metadata service IPv6 endpoint state |
| metadata_instance_metadata_tags | string | Instance metadata tags access |
| enclave_enabled | bool | Enable Nitro Enclaves |
| cpu_core_count | number | Number of CPU cores |
| cpu_threads_per_core | number | Number of threads per CPU core |
| capacity_reservation_preference | string | Capacity reservation preference |
| tags | map(string) | Resource tags |

### Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip | Private IP address of the instance |
| availability_zone | Availability zone of the instance |

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

## Resources Managed

- **EC2 Instance**: taher-private-runner-ubuntu (t2.medium)
  - AMI: ami-03250b0e01c28d196
  - Availability Zone: eu-central-1a
  - Private IP: 10.0.0.52
  - IMDSv2 required
  - 2 CPU cores, 1 thread per core

## Notes

- This configuration imports an existing EC2 instance
- IMDSv2 is enforced for enhanced security
- Root volume is configured to delete on termination
- Source/destination checking is enabled