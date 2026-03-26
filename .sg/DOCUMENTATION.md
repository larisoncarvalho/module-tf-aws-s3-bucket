# Route Table Infrastructure

## Overview

This Terraform stack manages VPC route table configuration in AWS. It provides a modular approach to creating and managing route tables within a VPC.

## Stack Information

- **Name**: route-table-infrastructure
- **Description**: VPC route table configuration
- **Region**: eu-central-1

## Modules

### route_table

Manages VPC route table resources.

**Resources**:
- `aws_route_table.this` - VPC route table

**Variables**:

| Name | Type | Description | Default |
|------|------|-------------|---------|
| vpc_id | string | VPC ID for the route table | - |
| tags | map(string) | Tags to apply to the route table | {} |

**Outputs**:

| Name | Description |
|------|-------------|
| route_table_id | Route table ID |
| route_table_arn | Route table ARN |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| vpc_id | string | VPC ID for the route table | - |
| tags | map(string) | Tags to apply to the route table | {} |

## Root Outputs

| Name | Description |
|------|-------------|
| route_table_id | Route table ID |
| route_table_arn | Route table ARN |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS provider >= 4.0
- Valid AWS credentials configured
- Existing VPC

### Deployment Steps

1. **Initialize Terraform**:
   ```bash
   tofu1.11.2 init
   ```

2. **Update Variables**:
   Edit `environments/terraform.tfvars` and replace placeholder values:
   - Set `vpc_id` to your actual VPC ID
   - Customize `tags` as needed

3. **Import Existing Resources**:
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

4. **Review Changes**:
   ```bash
   tofu1.11.2 plan -var-file environments/terraform.tfvars
   ```

5. **Apply Configuration**:
   ```bash
   tofu1.11.2 apply -var-file environments/terraform.tfvars
   ```

## Notes

- This stack imports an existing route table with ID `rtb-0a4eb3c9bae6aa8b5`
- After import, `terraform plan` should show zero changes (zero-drift goal)
- The route table is associated with the specified VPC
- Tags can be customized per environment via tfvars files