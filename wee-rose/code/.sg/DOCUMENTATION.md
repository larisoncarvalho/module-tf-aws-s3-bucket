# VPC Subnet Infrastructure

## Overview

This Terraform stack manages VPC subnet configuration with IPv6 support in the eu-central-1 region. The infrastructure imports and manages an existing subnet with both IPv4 and IPv6 CIDR blocks.

## Stack Description

VPC subnet configuration with IPv6 support

## Architecture

The stack consists of:

- **subnet module**: Manages VPC subnet with IPv4 and IPv6 CIDR blocks

## Modules

### subnet

Manages VPC subnet with IPv4 and IPv6 CIDR blocks.

**Resources:**
- `aws_subnet.this` - VPC subnet with IPv4 and IPv6 configuration

**Module Inputs:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| vpc_id | string | VPC ID where subnet will be created | Yes |
| cidr_block | string | IPv4 CIDR block for the subnet | Yes |
| availability_zone | string | Availability zone for subnet placement | Yes |
| assign_ipv6_address_on_creation | bool | Auto-assign IPv6 addresses to instances | Yes |
| ipv6_cidr_block | string | IPv6 CIDR block for the subnet | Yes |
| map_public_ip_on_launch | bool | Auto-assign public IPv4 addresses to instances | Yes |
| tags | map(string) | Resource tags | Yes |

**Module Outputs:**

| Name | Description |
|------|-------------|
| subnet_id | The ID of the subnet |
| subnet_arn | The ARN of the subnet |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | eu-central-1 |
| vpc_id | string | VPC ID where subnet will be created | vpc-0119b9388f2104572 |

## Root Outputs

| Name | Description |
|------|-------------|
| user_data_subnet_id | The ID of the user_data subnet |
| user_data_subnet_arn | The ARN of the user_data subnet |

## Module Calls

### user_data

Creates a subnet in the specified VPC with IPv4 CIDR block 10.0.0.128/27 and IPv6 CIDR block 2a05:d014:190:c680::/64 in availability zone eu-central-1a.

**Configuration:**
- VPC: Parameterized via `var.vpc_id`
- IPv4 CIDR: 10.0.0.128/27
- IPv6 CIDR: 2a05:d014:190:c680::/64
- Availability Zone: eu-central-1a
- Auto-assign IPv6: Disabled
- Auto-assign Public IP: Disabled
- Tags: Name=user-data, Resource-Type=nonprod

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Existing VPC: vpc-0119b9388f2104572
- Existing subnet: subnet-01881cec8b99f3091

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

### Expected Behavior

After running the import script, `terraform plan` should show **zero changes**, confirming that the Terraform configuration matches the existing AWS infrastructure exactly.

## Notes

- This stack imports existing infrastructure and should show zero drift after import
- The subnet is configured with both IPv4 and IPv6 CIDR blocks
- Public IP assignment is disabled for both IPv4 and IPv6
- The subnet is tagged for nonprod environment usage