# Lambda@Edge Execution Role Stack

## Overview

This Terraform stack manages a Lambda@Edge execution role with CloudWatch Logs and S3 permissions. The role is configured to be assumed by both Lambda@Edge and standard Lambda services, with inline policies granting necessary permissions for logging and S3 object operations.

## Stack Description

- **Name**: lambda-edge-execution-role
- **Region**: us-east-1
- **Purpose**: Provides IAM role and policies for Lambda@Edge function execution

## Module Overview

### iam_role

Manages an IAM role with inline policies for Lambda@Edge execution. This module creates a single IAM role with a trust policy allowing assumption by Lambda services, and attaches one or more inline policies for permissions management.

**Resources**:
- `aws_iam_role.this` - The IAM role resource
- `aws_iam_role_policy.this` - Inline policies attached to the role (for_each)

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | us-east-1 |
| inline_policies | map(object) | Map of inline policies to attach to the role | See tfvars |

### Module Variables (iam_role)

| Name | Type | Description | Default |
|------|------|-------------|---------|
| role_name | string | Name of the IAM role | - |
| path | string | Path for the IAM role | - |
| max_session_duration | number | Maximum session duration in seconds | - |
| assume_role_policy_document | object | Trust policy document for role assumption | - |
| inline_policies | map(object) | Map of inline policies to attach to the role | {} |

## Outputs

| Name | Description | Source |
|------|-------------|--------|
| role_arn | ARN of the Lambda@Edge execution role | module.lambda_edge_role.role_arn |
| role_name | Name of the Lambda@Edge execution role | module.lambda_edge_role.role_name |

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
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Resource Details

### IAM Role

- **Name**: 0eu096k-9ci2y0p
- **Path**: /
- **Max Session Duration**: 3600 seconds (1 hour)
- **Trust Policy**: Allows assumption by edgelambda.amazonaws.com and lambda.amazonaws.com

### Inline Policies

#### policy_1 (0eu096k-9ci2y0p-policy)

Grants the following permissions:

1. **CloudWatch Logs**:
   - CreateLogGroup
   - CreateLogStream
   - PutLogEvents
   - Resource: * (all log groups)

2. **S3 Access**:
   - GetObject
   - PutObject
   - Resource: arn:aws:s3:::xstack-landing-nonprod/*

## Notes

- This stack imports existing AWS resources. After import, `terraform plan` should show no changes.
- The role is specifically configured for Lambda@Edge, which requires deployment in us-east-1.
- Inline policies are managed as code and can be extended by adding entries to the `inline_policies` variable.