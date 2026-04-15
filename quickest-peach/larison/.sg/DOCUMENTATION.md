# EC2 Instance Ubuntu Debugging Stack

## Overview

This Terraform stack manages an EC2 instance for Ubuntu debugging workload in the eu-central-1 region. The stack imports an existing EC2 instance and provides a modular structure for managing instance configuration.

## Architecture

The stack consists of a single module:

- **instance**: Manages the EC2 instance with comprehensive configuration options including metadata service settings, capacity reservations, and enclave support

## Module: instance

### Description

Manages EC2 instance and associated resources with full control over instance configuration, metadata service, monitoring, and storage options.

### Resources

- `aws_instance.this`: EC2 instance with configurable compute, networking, and storage settings

### Inputs

| Name | Type | Description | Required |
|------|------|-------------|----------|
| ami_id | string | AMI ID for the instance | yes |
| instance_type | string | EC2 instance type | yes |
| availability_zone | string | Availability zone for instance placement | yes |
| key_name | string | SSH key pair name | yes |
| subnet_id | string | VPC subnet ID for instance placement | yes |
| security_group_ids | list(string) | Security group IDs to attach | yes |
| private_ip | string | Private IP address | yes |
| source_dest_check | bool | Enable source/destination checking | yes |
| ebs_optimized | bool | Enable EBS optimization | yes |
| monitoring | bool | Enable detailed monitoring | yes |
| tenancy | string | Instance tenancy | yes |
| hibernation | bool | Enable hibernation | yes |
| enclave_enabled | bool | Enable AWS Nitro Enclaves | yes |
| metadata_http_endpoint | string | Metadata service HTTP endpoint state | yes |
| metadata_http_tokens | string | Metadata service authentication method | yes |
| metadata_hop_limit | number | Metadata service hop limit | yes |
| metadata_http_protocol_ipv6 | string | Enable IPv6 for metadata service | yes |
| metadata_instance_tags | string | Enable instance tags in metadata | yes |
| capacity_reservation_preference | string | Capacity reservation preference | yes |
| root_volume_type | string | Root volume type | yes |
| root_delete_on_termination | bool | Delete root volume on termination | yes |
| tags | map(string) | Resource tags | yes |

### Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip | Private IP address of the instance |
| availability_zone | Availability zone of the instance |

## Root Module

### Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | eu-central-1 |
| ami_id | string | AMI ID for the EC2 instance | ami-081d42a282b78e6d3 |
| subnet_id | string | VPC subnet ID for instance placement | subnet-072669658da496c4a |
| security_group_ids | list(string) | Security group IDs to attach to the instance | ["sg-064cbb231ba1bca24"] |
| root_volume_type | string | Root volume type for the instance | gp2 |

### Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip | Private IP address of the instance |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS provider ~> 5.0
- Valid AWS credentials configured
- Existing VPC, subnet, and security group resources

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

3. **Review Changes**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```
   
   After import, this should show no changes, confirming zero drift.

4. **Apply Configuration**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Instance Configuration

The stack configures the following instance settings:

- **Instance Type**: t2.large
- **Availability Zone**: eu-central-1a
- **Key Pair**: nonprod-euc1
- **Private IP**: 10.0.0.53
- **Metadata Service**: IMDSv1 (optional tokens)
- **Monitoring**: Basic monitoring (not detailed)
- **EBS Optimization**: Disabled
- **Tenancy**: Default (shared hardware)

### Customization

To modify the instance configuration, update the values in `environments/terraform.tfvars` or adjust the hardcoded values in the module call within `main.tf`.

## Security Considerations

- The instance uses IMDSv1 (metadata_http_tokens = "optional"). Consider upgrading to IMDSv2 (required) for enhanced security
- Source/destination checking is enabled
- Instance metadata tags are disabled
- Root volume is set to delete on termination

## Maintenance

- Review and update the AMI ID periodically for security patches
- Monitor instance performance and adjust instance type if needed
- Regularly review security group rules
- Consider enabling detailed monitoring for production workloads