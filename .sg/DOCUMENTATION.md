# IAM Role Infrastructure

## Overview

This Terraform stack manages an IAM role for EC2 private runner with SSM and S3 access. The infrastructure is designed to import and manage existing AWS IAM resources with zero drift.

## Stack Description

- **Name**: iam-role-infrastructure
- **Region**: global
- **Purpose**: Manages IAM role with trust policy and policy attachments for EC2 private runner

## Module Overview

### iam_role

Manages IAM role with trust policy and policy attachments.

**Resources**:
- `aws_iam_role.this` - IAM role with trust policy
- `aws_iam_role_policy_attachment.this` - Policy attachments (for_each)

## Variables Reference

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "global" |
| attached_policies | map(object) | Map of policy attachments for the role | See tfvars |

### Module Variables (iam_role)

| Name | Type | Description | Default |
|------|------|-------------|---------|
| role_name | string | Name of the IAM role | - |
| path | string | Path for the IAM role | - |
| assume_role_policy_document | object | Trust policy document for the role | - |
| max_session_duration | number | Maximum session duration in seconds | - |
| attached_policies | map(object) | Map of policy attachments for the role | {} |

## Outputs Reference

### Root Outputs

| Name | Description |
|------|-------------|
| role_arn | ARN of the IAM role |
| role_name | Name of the IAM role |

### Module Outputs (iam_role)

| Name | Description |
|------|-------------|
| role_arn | ARN of the IAM role |
| role_name | Name of the IAM role |
| role_id | ID of the IAM role |

## Usage Instructions

### 1. Initialize Terraform

```bash
tofu1.11.2 init
```

### 2. Import Existing Resources

Run the import script to import existing AWS resources:

```bash
chmod +x imports.sh
./imports.sh
```

### 3. Plan Changes

Review the execution plan to ensure zero drift:

```bash
tofu1.11.2 plan -var-file environments/terraform.tfvars
```

Expected output: No changes. Infrastructure is up-to-date.

### 4. Apply Configuration

If changes are needed, apply the configuration:

```bash
tofu1.11.2 apply -var-file environments/terraform.tfvars
```

## Resource Details

### IAM Role

- **Name**: Neha_Private_Runner-ec2-private-runner-role
- **Path**: /
- **Max Session Duration**: 3600 seconds (1 hour)
- **Trust Policy**: Allows EC2 service to assume the role

### Policy Attachments

1. **SSM Managed Instance Core**
   - Policy ARN: arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
   - Purpose: Enables AWS Systems Manager access

2. **S3 Assume Role Policy**
   - Policy ARN: arn:aws:iam::790543352839:policy/Neha_Private_Runner-ec2-runner-assume-s3-role-policy
   - Purpose: Allows assuming role for S3 access

## Notes

- This stack imports existing resources and is designed for zero-drift management
- All sensitive values should be managed through secure variable mechanisms
- The region is set to "global" as IAM is a global service
- Policy attachments are managed through a map variable for flexibility