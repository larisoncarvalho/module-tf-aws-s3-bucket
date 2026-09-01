# VPC Networking Stack

## Overview

This stack manages a VPC with private subnet, route table, and network ACL configuration in the eu-central-1 region.

## Architecture

The stack consists of four modules:

1. **vpc**: Manages the VPC configuration with DNS settings
2. **subnet**: Creates a private subnet in a specific availability zone
3. **route_table**: Manages the route table and its association with the subnet
4. **network_acl**: Configures the default network ACL with ingress/egress rules

## Modules

### vpc

Manages VPC configuration with customizable CIDR block, tenancy, and DNS settings.

**Resources:**
- `aws_vpc.this`

**Outputs:**
- `vpc_id`: The ID of the VPC
- `vpc_cidr_block`: The CIDR block of the VPC

### subnet

Creates and manages a subnet within the VPC.

**Resources:**
- `aws_subnet.this`

**Outputs:**
- `subnet_id`: The ID of the subnet
- `availability_zone`: The availability zone of the subnet

### route_table

Manages a route table and associates it with a subnet.

**Resources:**
- `aws_route_table.this`
- `aws_route_table_association.this`

**Outputs:**
- `route_table_id`: The ID of the route table

### network_acl

Configures the default network ACL with allow-all ingress and egress rules.

**Resources:**
- `aws_default_network_acl.this`

**Outputs:**
- `network_acl_id`: The ID of the network ACL

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the resources | eu-central-1 |
| vpc_cidr_block | string | The IPv4 CIDR block for the VPC | 10.0.0.0/16 |
| subnet_cidr_block | string | The IPv4 CIDR block for the subnet | 10.0.120.0/24 |
| availability_zone | string | The availability zone for the subnet | eu-central-1b |
| enable_dns_hostnames | bool | Enable DNS hostnames in the VPC | true |
| enable_dns_support | bool | Enable DNS support in the VPC | true |
| default_network_acl_id | string | The ID of the default network ACL | acl-068fda75d8558d0c0 |
| network_acl_subnet_ids | list(string) | List of subnet IDs to associate with the network ACL | See tfvars |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| subnet_id | The ID of the subnet |
| route_table_id | The ID of the route table |
| network_acl_id | The ID of the network ACL |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- This configuration imports existing AWS resources
- The network ACL allows all traffic (ingress and egress) from 0.0.0.0/0
- The subnet is configured as private (no public IP assignment)
- DNS hostnames and DNS support are enabled for the VPC