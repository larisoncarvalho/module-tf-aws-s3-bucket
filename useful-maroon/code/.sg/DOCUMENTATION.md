# EC2 Instance Infrastructure

## Overview

This Terraform stack manages an EC2 instance with comprehensive network configuration and block device mappings in the eu-central-1 region. The infrastructure is designed to import and manage an existing EC2 instance with full control over compute, networking, and storage settings.

## Architecture

The stack consists of a single module:

### Module: instance

Manages an EC2 instance with the following capabilities:
- Compute configuration (instance type, CPU settings)
- Network interface attachment with security groups
- Metadata service configuration (IMDSv2)
- Root block device management
- Nitro Enclaves support
- Capacity reservation preferences
- Detailed monitoring options

## Resources

- **aws_instance.this**: EC2 instance with t2.medium instance type, custom CPU configuration, and IMDSv2 enforcement

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | eu-central-1 |
| subnet_id | string | Subnet ID for the EC2 instance | subnet-072669658da496c4a |
| security_group_ids | list(string) | List of security group IDs to attach to the instance | ["sg-0d5bf7aeaa53bfb92"] |
| root_volume_type | string | Type of root block device volume | gp2 |

### Module Variables (instance)

| Name | Type | Description |
|------|------|-------------|
| ami_id | string | AMI ID for the instance |
| instance_type | string | EC2 instance type |
| availability_zone | string | Availability zone for instance placement |
| subnet_id | string | Subnet ID for network interface |
| security_group_ids | list(string) | Security group IDs to attach |
| key_name | string | SSH key pair name |
| monitoring_enabled | bool | Enable detailed monitoring |
| ebs_optimized | bool | Enable EBS optimization |
| source_dest_check | bool | Enable source/destination checking |
| tenancy | string | Instance tenancy |
| metadata_http_endpoint | string | Metadata service HTTP endpoint state |
| metadata_http_tokens | string | Metadata service HTTP tokens requirement |
| metadata_hop_limit | number | Metadata service HTTP PUT response hop limit |
| metadata_http_protocol_ipv6 | string | Metadata service IPv6 endpoint state |
| metadata_instance_tags | string | Instance metadata tags availability |
| root_volume_type | string | Root block device volume type |
| root_delete_on_termination | bool | Delete root volume on instance termination |
| enclave_enabled | bool | Enable Nitro Enclaves |
| cpu_core_count | number | Number of CPU cores |
| cpu_threads_per_core | number | Number of threads per CPU core |
| capacity_reservation_preference | string | Capacity reservation preference |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| private_ip_address | Private IP address of the EC2 instance |
| private_dns_name | Private DNS name of the EC2 instance |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS provider ~> 5.0
- Existing AWS infrastructure: VPC, subnet, security groups
- Existing EC2 instance to import (i-000e597ea8aa8260b)
- SSH key pair (taher-private-runner) configured in AWS

### Deployment Steps

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Import Existing Resources**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review Configuration**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```
   
   After import, this should show zero changes, confirming drift-free state.

4. **Apply Configuration** (if needed)
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Configuration Notes

- **IMDSv2 Enforcement**: The instance is configured with `http_tokens = "required"` for enhanced security
- **CPU Configuration**: Custom CPU settings with 2 cores and 1 thread per core
- **Monitoring**: Detailed monitoring is disabled by default
- **Root Volume**: gp2 volume type with automatic deletion on instance termination
- **Network**: Source/destination checking is enabled for standard routing behavior

### Customization

To modify the configuration:

1. Update values in `environments/terraform.tfvars` for environment-specific settings
2. Adjust hardcoded values in `main.tf` for instance-specific configurations
3. Run `terraform plan` to preview changes before applying

## Security Considerations

- IMDSv2 is enforced (http_tokens = "required") to prevent SSRF attacks
- Nitro Enclaves support is available but disabled by default
- Security groups control network access
- Root volume is configured for automatic deletion to prevent data leakage
- SSH key authentication is required for instance access

## Maintenance

- Review and update the AMI ID periodically for security patches
- Monitor instance metrics if detailed monitoring is enabled
- Ensure security group rules remain appropriate for workload requirements
- Verify capacity reservation settings align with cost optimization goals