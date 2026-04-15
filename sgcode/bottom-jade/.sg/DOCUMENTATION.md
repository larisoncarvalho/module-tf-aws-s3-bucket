# lambda-sqs-processor

Lambda function with IAM role for SQS processing

## Overview

This Terraform stack provisions a Lambda function with an IAM execution role configured for SQS processing. The stack consists of two modules:

- **iam_role**: Creates an IAM role with configurable policy attachments for Lambda execution
- **lambda_function**: Deploys a Lambda function with customizable runtime settings and configurations

## Modules

### iam_role

IAM role for Lambda execution with policy attachments

**Resources:**
- `aws_iam_role.this` - IAM role with assume role policy
- `aws_iam_role_policy_attachment.this` - Policy attachments for the role

**Outputs:**
- `role_arn` - ARN of the IAM role
- `role_name` - Name of the IAM role

### lambda_function

Lambda function for SQS processing

**Resources:**
- `aws_lambda_function.this` - Lambda function with runtime configuration

**Outputs:**
- `function_name` - Name of the Lambda function
- `function_arn` - ARN of the Lambda function

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| lambda_package_path | string | Path to the Lambda deployment package zip file | - |
| lambda_source_code_hash | string | Base64-encoded SHA256 hash of the Lambda package | - |

## Outputs

| Name | Description |
|------|-------------|
| lambda_function_name | Name of the Lambda function |
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

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Configuration

The stack is configured for the `eu-central-1` region. Update `providers.tf` to change the deployment region.

The Lambda function is configured with:
- Runtime: Python 3.9
- Memory: 128 MB
- Timeout: 900 seconds
- Architecture: x86_64
- Ephemeral storage: 512 MB

The IAM role includes:
- AmazonS3FullAccess policy
- Lambda basic execution role policy