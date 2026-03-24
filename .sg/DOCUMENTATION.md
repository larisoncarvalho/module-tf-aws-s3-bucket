# VPC Subnet Infrastructure

## Overview

This stack manages VPC subnet infrastructure in AWS. It provides a modular approach to creating and managing subnets within a VPC.

## Stack Description

VPC subnet infrastructure

## Modules

### subnet

Manages VPC subnet

**Location:** `modules/subnet/`

**Resources:**
- `aws_subnet.this` - VPC subnet resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| vpc_id | string | VPC ID for the subnet | "" |
| cidr_block | string | CIDR block for the subnet | "" |
| availability_zone | string | Availability zone for the subnet | "" |
| map_public_ip_on_launch | bool | Whether to auto-assign public IPs | false |
| tags | map(string) | Resource tags | {} |

## Outputs

| Name | Description |
|------|-------------|
| subnet_id | The ID of the subnet |
| subnet_arn | The ARN of the subnet |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS provider >= 4.0
- Valid AWS credentials configured
- Existing VPC

### Deployment Steps

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Configure Variables**
   
   Edit `environments/terraform.tfvars` with your values:
   ```hcl
   vpc_id                  = "vpc-xxxxxxxxxxxxx"
   cidr_block              = "10.0.1.0/24"
   availability_zone       = "eu-central-1a"
   map_public_ip_on_launch = false
   tags = {
     Environment = "production"
     ManagedBy   = "terraform"
   }
   ```

3. **Import Existing Resources**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

4. **Review Changes**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

5. **Apply Configuration**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

## Import Script

The `imports.sh` script imports the existing subnet resource into Terraform state. Run this before making any changes to ensure Terraform manages the existing infrastructure.

## Notes

- This configuration imports existing cloud resources
- After import, `terraform plan` should show no changes (zero drift)
- All sensitive values should be provided via variables, never hardcoded
- The subnet is created in the specified VPC and availability zone