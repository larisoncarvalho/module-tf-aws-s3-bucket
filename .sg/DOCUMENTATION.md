# VPC Networking Stack

## Overview

This stack manages a complete VPC networking setup with public and private subnets across two availability zones in the eu-central-1 region. It includes internet gateway configuration and routing tables for proper network segmentation.

## Architecture

The stack provisions:

- **VPC**: A single VPC with 10.0.0.0/16 CIDR block
- **Subnets**: Four subnets across two availability zones (eu-central-1a and eu-central-1b)
  - Two public subnets (10.0.0.0/24, 10.0.1.0/24)
  - Two private subnets (10.0.100.0/24, 10.0.101.0/24)
- **Internet Gateway**: Provides internet access for public subnets
- **Route Tables**: Four route tables managing traffic routing
- **Security Group**: Default VPC security group
- **Network ACL**: Default network ACL with permissive rules

## Modules

### vpc
Manages the VPC with CIDR block configuration and instance tenancy settings.

### subnet
Creates and manages VPC subnets with configurable CIDR blocks, availability zones, and public IP mapping.

### internet_gateway
Manages the internet gateway and its attachment to the VPC.

### route_table
Manages route tables, routes, and subnet associations. Handles routing for both public and private subnets.

### security_group
Manages the default VPC security group.

### network_acl
Manages the default network ACL with ingress and egress rules and subnet associations.

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| default_network_acl_id | string | Default network ACL ID | acl-07755df901c7f7f3f |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | VPC ID |
| subnet_ids | Map of subnet keys to subnet IDs |
| internet_gateway_id | Internet gateway ID |
| route_table_ids | Map of route table keys to route table IDs |

## Usage

### Initialize Terraform

```bash
tofu1.11.2 init
```

### Import Existing Resources

Run the import script to import all existing AWS resources:

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

Review the execution plan to ensure zero drift:

```bash
tofu1.11.2 plan -var-file environments/terraform.tfvars
```

### Apply Configuration

Apply the configuration (should show no changes after import):

```bash
tofu1.11.2 apply -var-file environments/terraform.tfvars
```

## Network Design

### Public Subnets
- **vpc_name-public-eu-central-1a**: 10.0.0.0/24
- **vpc_name-public-eu-central-1b**: 10.0.1.0/24
- Auto-assign public IPs enabled
- Route to internet via internet gateway

### Private Subnets
- **vpc_name-private-eu-central-1a**: 10.0.100.0/24
- **vpc_name-private-eu-central-1b**: 10.0.101.0/24
- No public IP assignment
- No direct internet access

### Routing
- Public route table routes 0.0.0.0/0 to internet gateway
- Private route tables have local VPC routing only
- Each availability zone has dedicated private route table