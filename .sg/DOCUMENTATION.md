# IAM Role Infrastructure

## Overview

This stack manages an IAM role with Lambda service trust policy and attached policy. The infrastructure is designed to support Lambda function execution with appropriate permissions.

## Stack Description

- **Name**: iam-role-infrastructure
- **Region**: global
- **Purpose**: Manages IAM role with assume role policy and policy attachments

## Modules

### iam_role

Manages IAM role with assume role policy and policy attachments.

**Resources:**
- `aws_iam_role.this` - IAM role with trust policy
- `aws_iam_role_policy_attachment.this` - Policy attachments (for_each)

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Module Variables (iam_role)

| Name | Type | Description | Default |
|------|------|-------------|---------|
| name | string | Name of the IAM role | - |
| assume_role_policy_document | object | Assume role policy document structure | - |
| max_session_duration | number | Maximum session duration in seconds | - |
| path | string | Path for the IAM role | - |
| attached_policy_arns | set(string) | Set of policy ARNs to attach to the role | [] |

## Outputs

| Name | Description |
|------|-------------|
| role_name | Name of the IAM role |
| role_arn | ARN of the IAM role |

## Module Outputs (iam_role)

| Name | Description |
|------|-------------|
| role_name | Name of the IAM role |
| role_arn | ARN of the IAM role |
| role_id | ID of the IAM role |

## Usage

### Initialize Terraform

```bash
tofu1.11.2 init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

```bash
tofu1.11.2 plan -var-file environments/terraform.tfvars
```

### Apply Configuration

```bash
tofu1.11.2 apply -var-file environments/terraform.tfvars
```

## Module Instance

### neha_private_runner_autoscale_lambda_role

IAM role for Lambda autoscaling with the following configuration:
- **Role Name**: Neha_Private_Runner-autoscale-lambda-role
- **Trust Policy**: Lambda service principal
- **Max Session Duration**: 3600 seconds
- **Attached Policies**: Neha_Private_Runner-autoscale-lambda-policy

## Notes

- This stack imports existing IAM resources
- The role is configured with Lambda service trust policy
- Policy attachments are managed through the module's for_each mechanism
- After import, `terraform plan` should show zero changes