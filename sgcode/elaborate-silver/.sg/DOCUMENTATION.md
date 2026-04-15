# Internet Gateway Stack

## Overview

This stack manages an internet gateway and its attachment to a VPC in AWS.

## Architecture

The stack consists of a single module:

- **internet_gateway**: Manages an AWS internet gateway resource attached to a specified VPC

## Modules

### internet_gateway

Manages an internet gateway attached to a VPC.

**Resources:**
- `aws_internet_gateway.this`: Internet gateway resource

**Variables:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| vpc_id | string | ID of the VPC to attach the internet gateway to | Yes |
| tags | map(string) | Tags to apply to the internet gateway | Yes |

**Outputs:**

| Name | Description |
|------|-------------|
| id | ID of the internet gateway |
| arn | ARN of the internet gateway |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| vpc_id | string | ID of the VPC | vpc-0d42c0c0bcf5e9d7e |

## Root Outputs

| Name | Description |
|------|-------------|
| internet_gateway_id | ID of the internet gateway |
| internet_gateway_arn | ARN of the internet gateway |

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
terraform plan -var-file environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file environments/terraform.tfvars
```

## Notes

- The internet gateway is attached to VPC `vpc-0d42c0c0bcf5e9d7e`
- Resources are imported from existing AWS infrastructure
- After import, `terraform plan` should show no changes