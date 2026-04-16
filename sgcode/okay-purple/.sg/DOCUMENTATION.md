# sagemaker-service-catalog-api-gateway-role

## Description

IAM role granting API Gateway permissions within the Amazon SageMaker Service Catalog portfolio, with an attached AWS managed policy.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AmazonSageMakerServiceCatalogProductsApiGatewayRole IAM role and its managed policy attachment. |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region for the provider. | — |
| `name` | `string` | Friendly name of the IAM role. | — |
| `path` | `string` | Path to the IAM role. | — |
| `description` | `string` | Description of the IAM role. | — |
| `max_session_duration` | `number` | Maximum session duration in seconds for the IAM role. | — |
| `assume_role_policy` | `string` | JSON-encoded assume-role policy document granting an entity permission to assume the role. | — |
| `attached_policy_arns` | `map(object({ arn = string }))` | Map of managed policy ARNs to attach to the IAM role. | `{}` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `role_arn` | ARN of the IAM role. |
| `role_name` | Name of the IAM role. |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
./imports.sh terraform
```

### 3. Plan (verify zero drift)

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```

## Resources Managed

| Resource | Import ID |
|----------|-----------|
| `module.iam_role.aws_iam_role.this` | `AmazonSageMakerServiceCatalogProductsApiGatewayRole` |
| `module.iam_role.aws_iam_role_policy_attachment.this["amazon_sagemaker_service_catalog_products_api_gateway_service_role_policy"]` | `AmazonSageMakerServiceCatalogProductsApiGatewayRole/arn:aws:iam::aws:policy/service-role/AmazonSageMakerServiceCatalogProductsApiGatewayServiceRolePolicy` |