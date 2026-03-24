# VPC Subnets Stack

## Overview

This stack manages VPC subnets across multiple availability zones in the `eu-central-1` region. It provides a flexible module for creating and managing AWS subnets with configurable properties.

## Architecture

The stack consists of a single module:

- **subnet**: Manages AWS VPC subnets with configurable availability zones, CIDR blocks, and public IP mapping

## Modules

### subnet

Manages VPC subnets with support for multiple subnets via a map-based configuration.

**Location**: `modules/subnet/`

**Resources**:
- `aws_subnet.this` - VPC subnet resources (for_each)

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |
| vpc_id | string | VPC ID for the subnets | - |
| subnets | map(object) | Map of subnets to create | - |

### Subnet Module Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| vpc_id | string | VPC ID for the subnets | - |
| subnets | map(object) | Map of subnets to create | {} |

**Subnet Object Structure**:
- `availability_zone` (string) - AWS availability zone
- `cidr_block` (string) - CIDR block for the subnet
- `map_public_ip_on_launch` (bool) - Whether to map public IPs on launch
- `tags` (map(string)) - Resource tags

## Outputs

### Root Outputs

| Name | Description |
|------|-------------|
| subnet_ids | Map of subnet keys to subnet IDs |
| subnet_arns | Map of subnet keys to subnet ARNs |

### Subnet Module Outputs

| Name | Description |
|------|-------------|
| subnet_ids | Map of subnet keys to subnet IDs |
| subnet_arns | Map of subnet keys to subnet ARNs |

## Usage

### Initial Setup

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Import Existing Resources**:
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Verify Configuration**:
   ```bash
   terraform plan -var-file environments/terraform.tfvars
   ```
   
   This should show no changes after import, confirming zero drift.

4. **Apply Configuration** (if needed):
   ```bash
   terraform apply -var-file environments/terraform.tfvars
   ```

### Managing Subnets

The stack currently manages two subnets:

- **sg_test_private_eu_central_1a**: Private subnet in eu-central-1a (10.0.110.0/24)
- **sg_test_public_eu_central_1b**: Public subnet in eu-central-1b (10.0.2.0/24)

To add or modify subnets, update the `subnets` variable in `environments/terraform.tfvars`.

### Example: Adding a New Subnet

```hcl
subnets = {
  # ... existing subnets ...
  
  new_private_subnet = {
    availability_zone       = "eu-central-1c"
    cidr_block              = "10.0.120.0/24"
    map_public_ip_on_launch = false
    tags = {
      Name = "new-private-subnet"
    }
  }
}
```

## Notes

- This stack imports existing AWS resources and is configured for zero-drift operation
- All subnet configurations are managed through the `subnets` map variable
- Public subnets have `map_public_ip_on_launch` set to `true`
- Private subnets have `map_public_ip_on_launch` set to `false`