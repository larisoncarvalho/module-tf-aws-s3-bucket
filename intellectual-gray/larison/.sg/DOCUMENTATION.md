# EC2 Instance Infrastructure

## Overview

This Terraform stack manages an EC2 instance with comprehensive network and compute configuration in the eu-central-1 region. The infrastructure imports an existing EC2 instance and manages its configuration through Infrastructure as Code.

## Stack Description

EC2 instance with EBS storage and network configuration

## Architecture

The stack consists of a single module:

### Module: instance

Manages EC2 instance with associated network interface and EBS volume

**Resources:**
- `aws_instance.this` - EC2 instance with full configuration including metadata options, capacity reservations, and enclave support

## Module Details

### instance Module

**Location:** `modules/instance/`

**Purpose:** Provides a configurable EC2 instance with advanced compute and security features

**Resources:**
- EC2 instance with customizable compute specifications
- Metadata service configuration (IMDSv2 support)
- Capacity reservation options
- AWS Nitro Enclaves support
- Root EBS volume configuration

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | "eu-central-1" |
| ami_id | string | AMI ID for the EC2 instance | "ami-081d42a282b78e6d3" |
| subnet_id | string | VPC subnet ID for instance placement | "subnet-072669658da496c4a" |
| security_group_ids | list(string) | Security group IDs to attach to instance | ["sg-064cbb231ba1bca24"] |

### Module Variables (instance)

| Name | Type | Description |
|------|------|-------------|
| ami_id | string | AMI ID for the instance |
| instance_type | string | EC2 instance type |
| availability_zone | string | Availability zone for instance placement |
| key_name | string | SSH key pair name |
| subnet_id | string | VPC subnet ID for instance placement |
| security_group_ids | list(string) | Security group IDs to attach to instance |
| source_dest_check | bool | Enable source/destination checking |
| ebs_optimized | bool | Enable EBS optimization |
| monitoring_enabled | bool | Enable detailed monitoring |
| tenancy | string | Instance tenancy |
| cpu_core_count | number | Number of CPU cores |
| cpu_threads_per_core | number | Number of threads per CPU core |
| hibernation_enabled | bool | Enable hibernation |
| enclave_enabled | bool | Enable AWS Nitro Enclaves |
| metadata_http_endpoint | string | Enable or disable metadata service HTTP endpoint |
| metadata_http_tokens | string | Metadata service authentication method |
| metadata_hop_limit | number | Metadata service HTTP PUT response hop limit |
| metadata_http_protocol_ipv6 | string | Enable or disable IPv6 for metadata service |
| metadata_instance_tags | string | Enable or disable instance tags in metadata |
| capacity_reservation_preference | string | Capacity reservation preference |
| tags | map(string) | Resource tags |

## Outputs

| Name | Description | Module Source |
|------|-------------|---------------|
| instance_id | EC2 instance ID | module.ubuntu_debugging.instance_id |
| private_ip | Private IP address of the instance | module.ubuntu_debugging.private_ip |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Existing VPC, subnet, and security group resources
- Valid AMI ID for the target region
- SSH key pair created in AWS

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

4. **Apply Configuration**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Configuration

The stack is configured through `environments/terraform.tfvars`. Modify this file to customize:
- AMI ID for different operating systems
- Subnet and security group assignments
- Region selection

### Instance Configuration

The ubuntu_debugging instance is configured with:
- Instance type: t2.large
- Availability zone: eu-central-1a
- CPU configuration: 2 cores, 1 thread per core
- Metadata service: IMDSv1 (optional tokens)
- No EBS optimization or detailed monitoring
- Default tenancy

### Security Considerations

- Instance uses IMDSv1 (optional tokens) - consider upgrading to IMDSv2 (required tokens) for enhanced security
- Source/destination checking is enabled
- No public IP address assignment
- Instance metadata tags are disabled
- Review security group rules to ensure least privilege access

### Maintenance

To update the instance configuration:
1. Modify the relevant variables in `environments/terraform.tfvars` or module inputs in `main.tf`
2. Run `terraform plan` to review changes
3. Apply changes with `terraform apply`

Note: Some changes (like instance type) may require instance restart or replacement.

## Import Reference

This stack imports existing AWS resources. The import script must be run before the first apply to avoid resource recreation.

**Imported Resources:**
- EC2 Instance: `i-08f2821d46fa1cbef`