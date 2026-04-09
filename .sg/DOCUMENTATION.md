# EC2 Instances Infrastructure

## Overview

This Terraform stack manages EC2 instances infrastructure in the eu-central-1 region.

## Modules

### instance

Manages EC2 instances with comprehensive configuration options including CPU settings, metadata options, capacity reservations, and enclave support.

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| instances | map(object) | EC2 instances configuration | See terraform.tfvars |

### Instance Module Variables

| Name | Type | Description |
|------|------|-------------|
| instances | map(object) | EC2 instances to create |

## Outputs

### Root Outputs

| Name | Description |
|------|-------------|
| instance_ids | Map of instance keys to instance IDs |
| instance_arns | Map of instance keys to instance ARNs |
| private_ips | Map of instance keys to private IP addresses |

### Instance Module Outputs

| Name | Description |
|------|-------------|
| instance_ids | Map of instance keys to instance IDs |
| instance_arns | Map of instance keys to instance ARNs |
| private_ips | Map of instance keys to private IP addresses |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

## Instance Configuration

Each instance in the `instances` map supports the following configuration:

- **Basic Settings**: AMI ID, instance type, availability zone, key name
- **Networking**: Subnet ID, security groups, public IP association, source/destination checks
- **Performance**: EBS optimization, CPU core count and threads per core
- **Monitoring**: CloudWatch detailed monitoring
- **Advanced**: Tenancy, enclave options, capacity reservations
- **Metadata Service**: HTTP endpoint, tokens, hop limit, IPv6, instance tags
- **Root Volume**: Volume type, delete on termination
- **Tags**: Resource tags

## Notes

- This stack imports existing EC2 instances
- Run `terraform plan` after import to verify zero drift
- All instance configuration is managed through the `instances` variable
- Supports multiple instances with different configurations