# IAM Roles Infrastructure

## Overview

This Terraform stack manages IAM roles for Lambda autoscaling and EC2 private runner instances. The infrastructure is designed to import and manage existing IAM roles with their associated policy attachments.

## Stack Description

- **Name**: iam-roles-infrastructure
- **Description**: IAM roles for Lambda autoscaling and EC2 private runner instances
- **Region**: global (IAM is a global service)

## Module Overview

### iam_role

Manages IAM roles with assume role policies and policy attachments.

**Resources:**
- `aws_iam_role.this` - The IAM role resource
- `aws_iam_role_policy_attachment.this` - Policy attachments (for_each over attached_policy_arns)

**Key Features:**
- Configurable assume role policy documents
- Support for multiple policy attachments
- Customizable session duration and path

## Variables Reference

### Root Variables

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | string | AWS region (global for IAM resources) | - |
| `roles` | map(object) | Map of IAM roles to create with their configurations | - |

### Role Object Structure

Each role in the `roles` map contains:

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Name of the IAM role |
| `path` | string | Path for the IAM role |
| `assume_role_policy_document` | any | Assume role policy document structure |
| `max_session_duration` | number | Maximum session duration in seconds |
| `attached_policy_arns` | set(string) | Set of policy ARNs to attach to the role |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `role_names` | Map of role keys to role names |
| `role_arns` | Map of role keys to role ARNs |

## Managed Roles

This stack manages the following IAM roles:

1. **Neha_Private_Runner-autoscale-lambda-role**
   - Purpose: Lambda autoscaling execution role
   - Service: lambda.amazonaws.com
   - Attached Policies:
     - Neha_Private_Runner-autoscale-lambda-policy

2. **Neha_Private_Runner-ec2-private-runner-role**
   - Purpose: EC2 private runner instance role
   - Service: ec2.amazonaws.com
   - Attached Policies:
     - AmazonSSMManagedInstanceCore (AWS managed)
     - Neha_Private_Runner-ec2-runner-assume-s3-role-policy

## Usage Instructions

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Import Existing Resources

Run the import script to import existing IAM roles and policy attachments:

```bash
chmod +x imports.sh
./imports.sh
```

### 3. Review Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

After import, this should show **no changes** (zero drift).

### 4. Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- IAM is a global service, but the region variable is set to "global" for consistency
- The stack imports existing resources to bring them under Terraform management
- Policy attachments are managed as separate resources with for_each iteration
- All assume role policy documents are stored as structured objects and encoded to JSON at runtime