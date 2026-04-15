# VPC Subnet Infrastructure

## Overview

This stack manages VPC subnet resources in AWS. It provides a modular approach to creating and managing subnets within an existing VPC.

## Stack Information

- **Name**: vpc-subnet-infrastructure
- **Description**: VPC subnet configuration
- **Region**: eu-central-1

## Modules

### subnet

Manages VPC subnet resources.

**Resources**:
- `aws_subnet.this` - VPC subnet

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| vpc_id | string | VPC ID where subnet will be created | - |
| cidr_block | string | CIDR block for the subnet | - |
| availability_zone | string | Availability zone for the subnet | - |

## Outputs

| Name | Description |
|------|-------------|
| subnet_id | Subnet ID |
| subnet_arn | Subnet ARN |

## Usage

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### 3. Review Configuration

Update `environments/terraform.tfvars` with your specific values:

```hcl
region            = "eu-central-1"
vpc_id            = "vpc-xxxxx"
cidr_block        = "10.0.1.0/24"
availability_zone = "eu-central-1a"
```

### 4. Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### 5. Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- This configuration imports an existing subnet with ID `subnet-0040994dc4624807c`
- Ensure the VPC ID, CIDR block, and availability zone match the existing subnet configuration
- After import, `terraform plan` should show no changes if values are correctly configured