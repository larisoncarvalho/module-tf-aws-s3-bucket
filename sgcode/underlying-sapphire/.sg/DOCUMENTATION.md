# VPC Networking Infrastructure

## Overview

This Terraform stack manages a VPC with public and private subnets across two availability zones, including routing, internet gateway, and network ACLs.

**Region:** eu-central-1

## Architecture

The stack consists of the following module:

### Module: vpc

VPC with DHCP options

**Resources:**
- `aws_vpc.this` - VPC with DNS support and hostnames enabled
- `aws_subnet.this` - Subnets across multiple availability zones (public and private)
- `aws_internet_gateway.this` - Internet gateway for public internet access
- `aws_route_table.this` - Route tables for subnet routing
- `aws_route.this` - Routes within route tables
- `aws_route_table_association.this` - Associations between subnets and route tables
- `aws_main_route_table_association.this` - Main route table association for the VPC
- `aws_default_security_group.this` - Default security group for the VPC
- `aws_default_network_acl.this` - Default network ACL with allow-all rules

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| subnets | map(object) | Map of subnets to create in the VPC | See terraform.tfvars |
| route_tables | map(object) | Map of route tables to create | See terraform.tfvars |
| routes | map(object) | Map of routes to create in route tables | See terraform.tfvars |
| route_table_associations | map(object) | Map of route table to subnet associations | See terraform.tfvars |

### Module Variables (vpc)

| Name | Type | Description | Default |
|------|------|-------------|---------|
| name | string | Name tag for VPC and related resources | - |
| cidr_block | string | CIDR block for the VPC | - |
| instance_tenancy | string | Tenancy option for instances launched into the VPC | - |
| subnets | map(object) | Map of subnets to create in the VPC | {} |
| route_tables | map(object) | Map of route tables to create | {} |
| routes | map(object) | Map of routes to create in route tables | {} |
| route_table_associations | map(object) | Map of route table to subnet associations | {} |
| main_route_table_key | string | Key of the route table to set as main route table | - |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | ID of the VPC |
| subnet_ids | Map of subnet keys to subnet IDs |
| internet_gateway_id | ID of the internet gateway |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

Or for OpenTofu:

```bash
./imports.sh tofu
```

### Plan Changes

```bash
terraform plan -var-file environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file environments/terraform.tfvars
```

## Network Configuration

The VPC is configured with:
- **CIDR Block:** 10.0.0.0/16
- **Availability Zones:** eu-central-1a, eu-central-1b
- **Public Subnets:** 10.0.0.0/24 (1a), 10.0.1.0/24 (1b)
- **Private Subnets:** 10.0.100.0/24 (1a), 10.0.101.0/24 (1b)

Public subnets have internet access via the internet gateway and public route table. Private subnets use dedicated route tables without internet gateway routes.