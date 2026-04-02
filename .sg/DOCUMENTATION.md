# CloudFormation Stack Management

## Overview

This Terraform stack manages a CloudFormation stack deployment for VPC infrastructure with public and private subnets in the eu-central-1 region.

## Stack Description

Manages CloudFormation stack for VPC infrastructure with public and private subnets

## Module Overview

### cloudformation_stack

Manages CloudFormation stack deployment

**Resources:**
- `aws_cloudformation_stack.this` - CloudFormation stack resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | "eu-central-1" |
| cloudformation_template | string | CloudFormation template body (JSON or YAML) | See tfvars |

## Outputs

| Name | Description |
|------|-------------|
| stack_id | ID of the CloudFormation stack |
| stack_name | Name of the CloudFormation stack |

## Module: cloudformation_stack

### Variables

| Name | Type | Description |
|------|------|-------------|
| stack_name | string | Name of the CloudFormation stack |
| capabilities | list(string) | List of capabilities required by the stack |
| disable_rollback | bool | Whether to disable rollback on stack creation failure |
| parameters | map(string) | Map of parameter keys and values for the stack |
| template_body | string | CloudFormation template body (JSON or YAML) |

### Outputs

| Name | Description |
|------|-------------|
| stack_id | ID of the CloudFormation stack |
| stack_name | Name of the CloudFormation stack |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS credentials configured
- Appropriate IAM permissions for CloudFormation stack management

### Deployment Steps

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review Changes:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Stack Configuration

The CloudFormation stack is configured with the following parameters:

- **VPC CIDR:** 10.20.0.0/16
- **Public Subnets:** 10.20.10.0/24, 10.20.20.0/24, 10.20.25.0/24
- **Private Subnets:** 10.20.30.0/24, 10.20.40.0/24
- **Project Name:** stackguardian
- **Environment:** dev

### Important Notes

- The CloudFormation template body must be provided in the `cloudformation_template` variable
- The stack requires `CAPABILITY_IAM` capability
- Rollback is enabled by default (disable_rollback = false)
- The stack is imported from an existing CloudFormation stack in AWS

## Maintenance

To update the stack:

1. Modify the template or parameters in `environments/terraform.tfvars` or `main.tf`
2. Run `terraform plan` to review changes
3. Run `terraform apply` to apply updates

To destroy the stack:

```bash
terraform destroy -var-file=environments/terraform.tfvars
```

**Warning:** This will delete the CloudFormation stack and all resources it manages.