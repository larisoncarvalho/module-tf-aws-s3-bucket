# VPC Subnet Infrastructure

## Overview

This Terraform stack manages VPC subnet infrastructure for a private network in the eu-central-1b availability zone. It imports and manages an existing AWS subnet with specific networking configurations.

## Stack Description

- **Name**: vpc-subnet-infrastructure
- **Region**: eu-central-1
- **Description**: VPC subnet infrastructure for private network in eu-central-1b

## Module Overview

### subnet

Manages VPC subnet configuration with full control over DNS, IPv6, and networking settings.

**Resources**:
- `aws_subnet.this` - VPC subnet resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Outputs

| Name | Description |
|------|-------------|
| subnet_id | ID of the subnet |
| subnet_arn | ARN of the subnet |

## Module: subnet

### Variables

| Name | Type | Description |
|------|------|-------------|
| vpc_id | string | VPC ID where the subnet will be created |
| cidr_block | string | CIDR block for the subnet |
| availability_zone | string | Availability zone for the subnet |
| map_public_ip_on_launch | bool | Whether to map public IP on launch |
| assign_ipv6_address_on_creation | bool | Whether to assign IPv6 address on creation |
| enable_dns64 | bool | Whether to enable DNS64 |
| enable_resource_name_dns_a_record_on_launch | bool | Whether to enable resource name DNS A record on launch |
| enable_resource_name_dns_aaaa_record_on_launch | bool | Whether to enable resource name DNS AAAA record on launch |
| ipv6_native | bool | Whether the subnet is IPv6 native |
| private_dns_hostname_type_on_launch | string | Private DNS hostname type on launch |
| tags | map(string) | Tags to apply to the subnet |

### Outputs

| Name | Description |
|------|-------------|
| subnet_id | ID of the subnet |
| subnet_arn | ARN of the subnet |
| availability_zone_id | Availability zone ID of the subnet |

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

## Configuration Details

The stack manages a private subnet with the following characteristics:

- **VPC**: vpc-01a8cd328684b0618
- **CIDR Block**: 10.0.120.0/24
- **Availability Zone**: eu-central-1b
- **Public IP Mapping**: Disabled
- **IPv6**: Disabled
- **DNS Configuration**: IP-name hostname type

This is a private subnet configuration suitable for internal resources that do not require direct internet access.