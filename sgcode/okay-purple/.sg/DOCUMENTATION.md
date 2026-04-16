# sagemaker-service-catalog-api-gateway-role

## Description

IAM role granting API Gateway permissions within the Amazon SageMaker portfolio of products.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AmazonSageMakerServiceCatalogProductsApiGatewayRole IAM role |

## Resources

| Resource | Type | Description |
|----------|------|-------------|
| `aws_iam_role.this` | `aws_iam_role` | IAM role for SageMaker Service Catalog API Gateway |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | `string` | AWS region for the provider |
| `iam_role_name` | `string` | Friendly name of the IAM role |
| `iam_role_path` | `string` | Path to the IAM role |
| `iam_role_description` | `string` | Description of the IAM role |
| `iam_role_assume_role_policy` | `string` | Policy document granting an entity permission to assume the role (JSON string) |
| `iam_role_max_session_duration` | `number` | Maximum session duration in seconds for the IAM role |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `role_name` | Name of the IAM role |
| `role_arn` | ARN of the IAM role |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

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