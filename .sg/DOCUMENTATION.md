# EC2 Instance Infrastructure

## Overview

This Terraform stack manages an EC2 instance with network configuration in the eu-central-1 region. The infrastructure is designed to import and manage an existing EC2 instance with comprehensive configuration options including metadata service settings, CPU configuration, and enclave support.

## Architecture

The stack consists of a single module that manages an EC2 instance with the following features:

- **Instance Module**: Manages EC2 instance configuration with full control over compute, networking, and metadata settings
  - Configurable instance type, AMI, and availability zone
  - Network configuration with subnet and security group attachment
  - Public IP association
  - Metadata service configuration (IMDSv2 support)
  - CPU core and thread configuration
  - Nitro Enclaves support
  - EBS optimization and monitoring options

## Module Structure

### Instance Module (`modules/instance`)

Manages a single EC2 instance with comprehensive configuration options.

**Resources:**
- `aws_instance.this` - EC2 instance with network and metadata configuration

**Key Features:**
- Root block device with GP2 volume type
- Metadata service configuration for security
- CPU topology customization
- Enclave options for secure computing
- Source/destination checking control

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | string | AWS region for resource deployment | `"eu-central-1"` |
| `ami_id` | string | AMI ID for the EC2 instance | `"ami-074dd8e8dac7651a5"` |
| `subnet_id` | string | VPC subnet ID for instance placement | `"subnet-0b77c0d76befaf70d"` |
| `security_group_ids` | list(string) | Security group IDs to attach to the instance | `["sg-057053456dac1810d"]` |

### Module Variables (Instance)

| Name | Type | Description |
|------|------|-------------|
| `ami_id` | string | AMI ID for the instance |
| `instance_type` | string | EC2 instance type |
| `availability_zone` | string | Availability zone for instance placement |
| `key_name` | string | SSH key pair name |
| `subnet_id` | string | VPC subnet ID for instance placement |
| `security_group_ids` | list(string) | Security group IDs to attach |
| `source_dest_check` | bool | Enable source/destination checking |
| `ebs_optimized` | bool | Enable EBS optimization |
| `monitoring` | bool | Enable detailed monitoring |
| `tenancy` | string | Instance tenancy |
| `metadata_http_endpoint` | string | Metadata service HTTP endpoint state |
| `metadata_http_tokens` | string | Metadata service HTTP tokens requirement |
| `metadata_http_put_response_hop_limit` | number | Metadata service HTTP PUT response hop limit |
| `metadata_http_protocol_ipv6` | string | Metadata service IPv6 endpoint state |
| `metadata_instance_metadata_tags` | string | Instance metadata tags access state |
| `enclave_enabled` | bool | Enable Nitro Enclaves |
| `cpu_core_count` | number | Number of CPU cores |
| `cpu_threads_per_core` | number | Number of threads per CPU core |

## Outputs

| Name | Description |
|------|-------------|
| `instance_id` | EC2 instance ID |
| `private_ip` | Private IP address of the instance |
| `public_ip` | Public IP address of the instance |

## Usage

### Initial Setup

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review Configuration:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Configuration Notes

- The instance is configured with a t3.micro instance type in eu-central-1a
- Public IP association is enabled for external connectivity
- Metadata service is configured with optional IMDSv2 tokens
- Root volume uses GP2 storage with delete on termination enabled
- CPU configuration: 1 core with 2 threads per core
- Monitoring and EBS optimization are disabled for cost optimization

### Security Considerations

- Metadata service is configured with hop limit of 1 for container security
- IMDSv2 is set to optional mode (consider requiring for enhanced security)
- Source/destination checking is enabled
- Instance uses default tenancy
- Nitro Enclaves are disabled (enable if secure enclave computing is required)

### Customization

To modify the instance configuration:

1. Update values in `environments/terraform.tfvars` for environment-specific changes
2. Modify hardcoded values in `main.tf` for infrastructure-wide changes
3. Run `terraform plan` to preview changes before applying

## Import Information

This stack is designed to import an existing EC2 instance with ID `i-015dcccda629ac122`. The import script handles the initial state import to bring the existing resource under Terraform management.