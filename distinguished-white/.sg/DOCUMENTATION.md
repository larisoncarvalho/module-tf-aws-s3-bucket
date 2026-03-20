# Private Runner Infrastructure

## Overview

This Terraform stack manages an EC2 instance for private runner workloads in the eu-central-1 region. The infrastructure imports an existing EC2 instance with comprehensive configuration including metadata options, capacity reservations, and CPU customization.

## Architecture

### Modules

#### instance
Manages EC2 instance configuration with full control over compute, networking, security, and metadata settings.

**Resources:**
- `aws_instance.this` - EC2 instance with customized CPU, metadata, and capacity reservation settings

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | - |
| subnet_id | string | VPC subnet ID for instance network interface | - |
| security_group_ids | list(string) | Security group IDs to attach to instance | - |
| iam_instance_profile_arn | string | IAM instance profile ARN | - |

### Module: instance

| Name | Type | Description | Default |
|------|------|-------------|---------|
| ami_id | string | AMI ID for the instance | - |
| instance_type | string | EC2 instance type | - |
| availability_zone | string | Availability zone for instance placement | - |
| subnet_id | string | VPC subnet ID for instance network interface | - |
| security_group_ids | list(string) | Security group IDs to attach to instance | - |
| iam_instance_profile_arn | string | IAM instance profile ARN | - |
| key_name | string | EC2 key pair name for SSH access | - |
| ebs_optimized | bool | Enable EBS optimization | - |
| monitoring_enabled | bool | Enable detailed monitoring | - |
| source_dest_check | bool | Enable source/destination checking | - |
| tenancy | string | Instance tenancy | - |
| hibernation_enabled | bool | Enable hibernation support | - |
| enclave_enabled | bool | Enable Nitro Enclaves | - |
| metadata_http_endpoint | string | Instance metadata HTTP endpoint state | - |
| metadata_http_tokens | string | Instance metadata HTTP tokens requirement | - |
| metadata_hop_limit | number | Instance metadata HTTP PUT response hop limit | - |
| metadata_http_protocol_ipv6 | string | Instance metadata IPv6 endpoint state | - |
| metadata_instance_tags | string | Instance metadata tags access state | - |
| capacity_reservation_preference | string | Capacity reservation preference | - |
| root_delete_on_termination | bool | Delete root volume on instance termination | - |
| cpu_core_count | number | Number of CPU cores | - |
| cpu_threads_per_core | number | Number of threads per CPU core | - |
| tags | map(string) | Resource tags | - |

## Outputs

### Root Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip_address | Private IP address of the instance |

### Module: instance

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip_address | Private IP address of the instance |
| availability_zone | Availability zone where instance is deployed |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS provider ~> 5.0
- AWS credentials configured
- Existing EC2 instance: i-08663188cc77a9249

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
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Configuration

Environment-specific values are defined in `environments/terraform.tfvars`. Modify this file to customize:
- Network configuration (subnet, security groups)
- IAM instance profile
- AWS region

The instance configuration (AMI, instance type, metadata options, CPU settings) is hardcoded in `main.tf` as these are infrastructure-specific and not environment-dependent.

## Security Considerations

- Instance metadata requires IMDSv2 (http_tokens = "required")
- Root volume is configured to delete on termination
- IAM instance profile provides necessary permissions
- Security groups control network access
- SSH access via key pair "private-runner-workshop"

## Notes

- This stack imports an existing EC2 instance - do not destroy without coordination
- Instance is tagged "private-runner-do-not-delete" to prevent accidental deletion
- CPU configuration: 2 cores, 1 thread per core
- Metadata hop limit set to 2 for container workloads
- No detailed monitoring or EBS optimization enabled (cost optimization)