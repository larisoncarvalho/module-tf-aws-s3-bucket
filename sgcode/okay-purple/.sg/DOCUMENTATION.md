# sagemaker-service-catalog-api-gateway-role

## Description

IAM role granting API Gateway permissions within the Amazon SageMaker portfolio of products.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AmazonSageMakerServiceCatalogProductsApiGatewayRole IAM role and its managed policy attachment |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_iam_role` | `this` | IAM role for SageMaker Service Catalog API Gateway |
| `aws_iam_role_policy_attachment` | `this` | Attaches managed policies to the IAM role |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | `string` | AWS region | — |
| `name` | `string` | Friendly name of the IAM role | — |
| `path` | `string` | Path to the IAM role | — |
| `description` | `string` | Description of the IAM role | — |
| `assume_role_policy` | `string` | JSON-encoded assume role policy document | — |
| `max_session_duration` | `number` | Maximum session duration in seconds | — |
| `attached_policy_arns` | `map(object({ arn = string }))` | Map of managed policy ARNs to attach to the IAM role | `{}` |

## Outputs Reference

| Output | Description |
|--------|-------------|
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
# or for OpenTofu:
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```