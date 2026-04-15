# VPC Infrastructure Stack

## Overview

This stack manages VPC network infrastructure with associated networking resources in the eu-central-1 region.

## Modules

### vpc

VPC with CIDR block configuration

**Resources:**
- `aws_vpc.this` - VPC resource with DNS and tenancy configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the infrastructure | eu-central-1 |
| dhcp_options_id | string | DHCP options ID | dopt-072442a92dcd107ab |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| vpc_cidr_block | The CIDR block of the VPC |

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

Or for OpenTofu:

```bash
./imports.sh tofu
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Architecture

The stack creates a VPC with the following configuration:
- CIDR block: 10.0.0.0/16
- DNS hostnames and support enabled
- Default instance tenancy
- Custom tagging support

The VPC module exposes the VPC ID and CIDR block for use by other infrastructure components.