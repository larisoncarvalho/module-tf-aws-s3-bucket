# VPC Route Tables Stack

## Overview

This stack manages VPC route tables with default local routes for two VPCs in the eu-central-1 region.

## Architecture

The stack uses a reusable `route_table` module to manage route tables and their associated routes. Each VPC has its own default route table instance.

### Modules

#### route_table

Manages VPC route tables and route associations.

**Resources:**
- `aws_route_table.this` - Main route table resource
- `aws_route.this` - Individual routes (for_each over var.routes)

**Variables:**

| Name | Type | Description | Default |
|------|------|-------------|---------|
| vpc_id | string | VPC ID for the route table | - |
| tags | map(string) | Resource tags | - |
| routes | map(object) | Non-local routes to create | {} |

**Outputs:**

| Name | Description |
|------|-------------|
| route_table_id | ID of the route table |
| route_table_arn | ARN of the route table |

## Root Configuration

### Module Instances

1. **sg_vpc_jkdsbfkjdsabv_default** - Route table for sg-vpc-jkdsbfkjdsabv
2. **sg_vpc_2_default** - Route table for sg-vpc-2

### Variables

| Name | Type | Description | Value |
|------|------|-------------|-------|
| region | string | AWS region | eu-central-1 |
| vpc_id_sg_vpc_jkdsbfkjdsabv | string | VPC ID for sg-vpc-jkdsbfkjdsabv | vpc-0e383da95ac6085aa |
| vpc_id_sg_vpc_2 | string | VPC ID for sg-vpc-2 | vpc-0b293571b9e90486c |

### Outputs

| Name | Description |
|------|-------------|
| sg_vpc_jkdsbfkjdsabv_default_route_table_id | Route table ID for sg-vpc-jkdsbfkjdsabv |
| sg_vpc_2_default_route_table_id | Route table ID for sg-vpc-2 |

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

- This stack imports existing route tables and manages them with Terraform
- Default local routes are automatically created by AWS and don't need explicit management
- Additional routes can be added via the `routes` variable in each module call