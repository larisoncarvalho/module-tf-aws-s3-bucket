# lambda-sqs-processor

Lambda function with IAM role for SQS processing

## Overview

This stack provisions:
- **iam_role**: IAM role for Lambda execution with S3 and basic execution policies
- **lambda_function**: Lambda function for SQS processing

## Modules

### iam_role

IAM role for Lambda execution with S3 and basic execution policies

**Resources:**
- `aws_iam_role.this`
- `aws_iam_role_policy_attachment.this` (for_each)

### lambda_function

Lambda function for SQS processing

**Resources:**
- `aws_lambda_function.this`

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Outputs

| Name | Description |
|------|-------------|
| lambda_function_arn | ARN of the Lambda function |
| iam_role_arn | ARN of the IAM role |

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
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Region

This stack is configured for region: **eu-central-1**