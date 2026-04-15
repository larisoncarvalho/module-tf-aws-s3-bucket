# Private Runner Infrastructure

## Overview

This Terraform stack manages an EC2 instance for private runner workloads in the eu-central-1 region. The infrastructure imports an existing EC2 instance and provides configuration management through Infrastructure as Code.

## Architecture

The stack consists of a single module that manages an EC2 instance with comprehensive configuration options including:

- Instance sizing and placement
- Network configuration
- Security settings
- Metadata service configuration
- CPU topology customization
- Root volume configuration

## Modules

### instance

Manages EC2 instance configuration with full control over instance parameters, metadata options, capacity reservations, and CPU topology.

**Resources:**
- `aws_instance.this` - EC2 instance with configurable parameters

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | eu-central-1 |
| ami_id | string | AMI ID for the EC2 instance | ami-081d42a282b78e6d3 |
| subnet_id | string | VPC subnet ID for instance placement | subnet-072669658da496c4a |
| security_group_ids | list(string) | Security group IDs to attach to the instance | ["sg-064cbb231ba1bca24"] |
| root_volume_type | string | Root volume type for the instance | gp2 |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID of the private runner |
| private_ip | Private IP address of the private runner |

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

3. **Verify Configuration:**
   ```bash
   terraform plan -var-file environments/terraform.tfvars
   ```
   
   After import, this should show no changes, confirming zero drift.

4. **Apply Changes (if needed):**
   ```bash
   terraform apply -var-file environments/terraform.tfvars
   ```

### Configuration Details

The private runner instance is configured with:

- **Instance Type:** t2.large
- **Availability Zone:** eu-central-1a
- **Private IP:** 10.0.0.38
- **SSH Key:** nonprod-euc1
- **CPU Configuration:** 2 cores, 1 thread per core
- **Metadata Service:** Enabled with optional IMDSv2
- **Root Volume:** gp2 type, deleted on termination

### Modifying Configuration

To modify the instance configuration:

1. Update values in `environments/terraform.tfvars` for environment-specific changes
2. Update hardcoded values in `main.tf` for structural changes
3. Run `terraform plan` to preview changes
4. Run `terraform apply` to apply changes

## Notes

- This stack imports an existing EC2 instance (i-0238c2160a7ed790b)
- The instance is configured with IMDSv2 optional mode for metadata access
- Source/destination checking is enabled
- EBS optimization and detailed monitoring are disabled
- The instance uses default tenancy with no hibernation support