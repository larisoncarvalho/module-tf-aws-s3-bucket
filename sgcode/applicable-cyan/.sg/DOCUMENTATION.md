# VPC Network Infrastructure

## Overview

This Terraform stack manages a complete VPC network infrastructure including VPC, subnets (public and private), internet gateway, route tables, security groups, network ACLs, VPC endpoints, EC2 instances, and EFS mount targets.

## Modules

### vpc
VPC with associated DHCP options

### subnet
Subnets within the VPC

### internet_gateway
Internet gateway for VPC

### route_table
Route tables for VPC subnets

### security_group
Security groups for VPC resources

### network_acl
Network ACLs for VPC subnets

### vpc_endpoint
VPC endpoints for AWS services

### instance
EC2 instances

### efs_mount_target
EFS mount targets

## Variables

| Name | Type | Description |
|------|------|-------------|
| region | string | AWS region |
| subnets | map(object) | Map of subnets to create |
| route_tables | map(object) | Map of route tables to create |
| routes | map(object) | Map of routes to create |
| route_table_associations | map(object) | Map of route table associations |
| dhcp_options_id | string | DHCP options ID |
| security_groups | map(object) | Map of security groups to create |
| ingress_rules | map(object) | Map of ingress rules |
| egress_rules | map(object) | Map of egress rules |
| network_acl_subnet_ids | list(string) | Subnet IDs to associate with the ACL |
| acl_rules | map(object) | Map of ACL rules |
| vpc_endpoints | map(object) | Map of VPC endpoints to create |
| instances | map(object) | Map of instances to create |
| efs_file_system_id | string | EFS file system ID |
| efs_mount_targets | map(object) | Map of mount targets to create |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | VPC ID |
| subnet_ids | Map of subnet IDs |
| security_group_ids | Map of security group IDs |
| instance_ids | Map of instance IDs |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

### Plan

```bash
terraform plan -var-file environments/sg.tfvars
```

### Apply

```bash
terraform apply -var-file environments/sg.tfvars
```