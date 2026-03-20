# GitHub Runner IAM Roles

## Overview

This Terraform stack manages IAM roles for GitHub Actions self-hosted runner infrastructure with Lambda autoscaling and EC2 runner instances.

## Architecture

The stack creates two IAM roles:

1. **Lambda Autoscale Role** - Used by Lambda functions to manage autoscaling of GitHub runners
2. **EC2 Runner Role** - Used by EC2 instances running as GitHub Actions self-hosted runners

## Modules

### iam_role

Manages IAM roles with trust policies and policy attachments.

**Resources:**
- `aws_iam_role.this` - The IAM role
- `aws_iam_role_policy_attachment.this` - Policy attachments (for_each over attached_policy_arns)

**Inputs:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| name | string | Name of the IAM role | Yes |
| assume_role_policy_document | object | Trust policy document for the role | Yes |
| max_session_duration | number | Maximum session duration in seconds | Yes |
| path | string | Path for the IAM role | Yes |
| attached_policy_arns | set(string) | Set of policy ARNs to attach to the role | No (default: []) |

**Outputs:**

| Name | Description |
|------|-------------|
| role_name | Name of the IAM role |
| role_arn | ARN of the IAM role |
| role_id | ID of the IAM role |

## Root Outputs

| Name | Description |
|------|-------------|
| lambda_role_arn | ARN of the Lambda autoscale role |
| lambda_role_name | Name of the Lambda autoscale role |
| ec2_runner_role_arn | ARN of the EC2 runner role |
| ec2_runner_role_name | Name of the EC2 runner role |

## Resources Managed

### Lambda Autoscale Role
- **Role Name:** Neha_Private_Runner-autoscale-lambda-role
- **Trust Policy:** Allows Lambda service to assume the role
- **Attached Policies:**
  - arn:aws:iam::790543352839:policy/Neha_Private_Runner-autoscale-lambda-policy

### EC2 Runner Role
- **Role Name:** Neha_Private_Runner-ec2-private-runner-role
- **Trust Policy:** Allows EC2 service to assume the role
- **Attached Policies:**
  - arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
  - arn:aws:iam::790543352839:policy/Neha_Private_Runner-ec2-runner-assume-s3-role-policy

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
terraform plan -var-file environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file environments/terraform.tfvars
```

## Notes

- This stack imports existing IAM resources
- All configuration values are hardcoded in main.tf
- No root-level variables are required
- The stack is region-agnostic (IAM is a global service)
- After import, `terraform plan` should show zero changes