# tf-ansible-vpc-infrastructure

## Description

VPC infrastructure with public/private subnets, route tables, internet gateway, security groups, and network ACL for tf-ansible-vpc. Deployed in `eu-central-1`.

## Module Overview

| Module | Source | Description |
|--------|--------|-------------|
| `vpc` | `git::https://github.com/StackGuardian/terraform-aws-vpc.git?ref=v5.1.0` | Creates VPC, public/private subnets, route tables, internet gateway, default security group, default network ACL, and default route table |

## Variables Reference

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `region` | `string` | `"eu-central-1"` | AWS region to deploy resources |
| `vpc_name` | `string` | `"tf-ansible-vpc"` | Name to be used on all VPC resources as identifier |
| `vpc_cidr` | `string` | `"10.0.0.0/16"` | The IPv4 CIDR block for the VPC |
| `vpc_instance_tenancy` | `string` | `"default"` | A tenancy option for instances launched into the VPC |
| `azs` | `list(string)` | `["eu-central-1a","eu-central-1b"]` | A list of availability zones |
| `public_subnets` | `list(string)` | `["10.0.1.0/24","10.0.2.0/24"]` | A list of public subnets inside the VPC |
| `private_subnets` | `list(string)` | `["10.0.110.0/24","10.0.120.0/24"]` | A list of private subnets inside the VPC |
| `map_public_ip_on_launch` | `bool` | `true` | Assign public IP to instances in public subnets |
| `create_igw` | `bool` | `true` | Controls if an Internet Gateway is created |
| `create_egress_only_igw` | `bool` | `false` | Controls if an Egress Only Internet Gateway is created |
| `enable_nat_gateway` | `bool` | `false` | Should be true to provision NAT Gateways |
| `manage_default_security_group` | `bool` | `true` | Adopt and manage default security group |
| `manage_default_network_acl` | `bool` | `true` | Adopt and manage Default Network ACL |
| `manage_default_route_table` | `bool` | `true` | Manage default route table |
| `create_vpc` | `bool` | `true` | Controls if VPC should be created |

## Outputs Reference

| Name | Description |
|------|-------------|
| `vpc_id` | The ID of the VPC |
| `vpc_cidr_block` | The CIDR block of the VPC |
| `public_subnets` | List of IDs of public subnets |
| `private_subnets` | List of IDs of private subnets |
| `igw_id` | The ID of the Internet Gateway |
| `public_route_table_ids` | List of IDs of public route tables |
| `private_route_table_ids` | List of IDs of private route tables |

## Usage Instructions

### 1. Initialize

```sh
tofu init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
./imports.sh tofu
```

### 3. Plan

```sh
tofu plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
tofu apply -var-file environments/sg.tfvars
```