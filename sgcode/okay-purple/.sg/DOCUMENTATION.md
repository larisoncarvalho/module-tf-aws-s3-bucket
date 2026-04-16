# sagemaker-service-catalog-api-gateway-role

## Description

IAM role granting API Gateway permissions within the Amazon SageMaker portfolio of products, with its managed policy attachment.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AmazonSageMakerServiceCatalogProductsApiGatewayRole IAM role and its attached managed policy via aws_iam_role_policy_attachment. |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region for the provider. |
| `name` | `string` | Friendly name of the IAM role. |
| `path` | `string` | Path to the IAM role. |
| `description` | `string` | Description of the IAM role. |
| `max_session_duration` | `number` | Maximum session duration in seconds for the IAM role. |
| `assume_role_policy` | `string` | JSON-encoded assume-role policy document granting an entity permission to assume the role. |
| `policy_attachments` | `map(object({policy_arn}))` | Map of managed policy ARNs to attach to the IAM role. |

## Outputs Reference

| Name | Description |
|------|-------------|
| `role_name` | Name of the IAM role. |
| `role_arn` | ARN of the IAM role. |
| `role_id` | Stable unique ID of the IAM role. |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
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