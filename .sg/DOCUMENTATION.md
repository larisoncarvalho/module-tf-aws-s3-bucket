# IAM Roles Infrastructure

## Overview

This stack manages IAM roles for Lambda autoscaling and EC2 private runner with policy attachments. The infrastructure is region-agnostic (global) and provides reusable IAM role management with assume role policies and attached managed policies.

## Architecture

The stack consists of:

- **iam_role module**: Reusable module for creating IAM roles with assume role policies and attaching managed policies
- **Two IAM roles**:
  - `Neha_Private_Runner-autoscale-lambda-role`: For Lambda autoscaling functions
  - `Neha_Private_Runner-ec2-private-runner-role`: For EC2 private runner instances

## Module: iam_role

### Description

Manages an IAM role with configurable assume role policy and multiple policy attachments.

### Resources

- `aws_iam_role.this`: The IAM role resource
- `aws_iam_role_policy_attachment.this`: Policy attachments (for_each over attached_policy_arns)

### Variables

| Name | Type | Description | Required |
|------|------|-------------|----------|
| name | string | Name of the IAM role | Yes |
| path | string | Path for the IAM role | Yes |
| assume_role_policy_document | object | Assume role policy document structure | Yes |
| max_session_duration | number | Maximum session duration in seconds | Yes |
| attached_policy_arns | set(string) | Set of policy ARNs to attach to the role | No (default: []) |

### Outputs

| Name | Description |
|------|-------------|
| role_name | Name of the IAM role |
| role_arn | ARN of the IAM role |
| role_id | ID of the IAM role |

## Root Configuration

### Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "global" |

### Outputs

| Name | Description |
|------|-------------|
| autoscale_lambda_role_arn | ARN of the autoscale Lambda role |
| ec2_private_runner_role_arn | ARN of the EC2 private runner role |

## Deployed Resources

### Lambda Autoscale Role

- **Name**: `Neha_Private_Runner-autoscale-lambda-role`
- **Assume Role Principal**: `lambda.amazonaws.com`
- **Attached Policies**:
  - `arn:aws:iam::790543352839:policy/Neha_Private_Runner-autoscale-lambda-policy`

### EC2 Private Runner Role

- **Name**: `Neha_Private_Runner-ec2-private-runner-role`
- **Assume Role Principal**: `ec2.amazonaws.com`
- **Attached Policies**:
  - `arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore`
  - `arn:aws:iam::790543352839:policy/Neha_Private_Runner-ec2-runner-assume-s3-role-policy`

## Usage

### Initialize

```bash
tofu init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan

```bash
tofu plan -var-file environments/terraform.tfvars
```

### Apply

```bash
tofu apply -var-file environments/terraform.tfvars
```

## Notes

- This stack imports existing IAM resources
- After import, `tofu plan` should show zero changes
- IAM is a global service; the region variable is set to "global" for consistency
- Policy attachments are managed as separate resources using for_each