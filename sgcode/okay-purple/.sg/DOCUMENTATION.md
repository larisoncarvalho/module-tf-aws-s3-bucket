# sagemaker-service-catalog-api-gateway-role

## Description

IAM role granting API Gateway permissions within the Amazon SageMaker portfolio of products.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AmazonSageMakerServiceCatalogProductsApiGatewayRole IAM role and its managed policy attachment |

## Resources

| Resource | Type | Description |
|----------|------|-------------|
| `aws_iam_role.this` | `aws_iam_role` | The IAM role for SageMaker Service Catalog API Gateway |
| `aws_iam_role_policy_attachment.this` | `aws_iam_role_policy_attachment` | Managed policy attachments for the IAM role |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region |
| `name` | `string` | Friendly name of the IAM role |
| `path` | `string` | Path to the IAM role |
| `description` | `string` | Description of the IAM role |
| `max_session_duration` | `number` | Maximum session duration in seconds |
| `assume_role_policy` | `string` | JSON-encoded assume role policy document |
| `attached_policy_arns` | `set(string)` | Set of managed policy ARNs to attach to the IAM role |

## Outputs Reference

| Name | Description |
|------|-------------|
| `role_arn` | ARN of the IAM role |
| `role_name` | Name of the IAM role |
| `role_id` | Stable and unique string identifying the IAM role |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
./imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```