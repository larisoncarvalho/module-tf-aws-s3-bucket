# sagemaker-service-catalog-api-gateway-role

## Description

IAM role granting API Gateway permissions within the Amazon SageMaker portfolio of products, with attached AWS managed service role policy.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AmazonSageMakerServiceCatalogProductsApiGatewayRole IAM role and its managed policy attachment |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_iam_role` | `this` | IAM role for SageMaker Service Catalog API Gateway products |
| `aws_iam_role_policy_attachment` | `this` | Attaches the AmazonSageMakerServiceCatalogProductsApiGatewayServiceRolePolicy managed policy |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | `string` | AWS region | — |
| `iam_role_name` | `string` | Friendly name of the IAM role | — |
| `iam_role_path` | `string` | Path to the IAM role | — |
| `iam_role_description` | `string` | Description of the IAM role | — |
| `iam_role_assume_role_policy` | `string` | JSON-encoded assume role policy document | — |
| `iam_role_max_session_duration` | `number` | Maximum session duration in seconds | — |
| `iam_role_attached_policy_arns` | `map(object)` | Map of managed policy ARNs to attach | `{}` |

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