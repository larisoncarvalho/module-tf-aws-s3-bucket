# sagemaker-service-catalog-launch-role

## Description

IAM role for SageMaker Service Catalog products launch, with attached AWS managed policy for ServiceCatalog products service role.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AmazonSageMakerServiceCatalogProductsLaunchRole IAM role and its managed policy attachment. |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_iam_role` | `this` | The SageMaker Service Catalog products launch IAM role. |
| `aws_iam_role_policy_attachment` | `this` | Managed policy attachments for the IAM role. |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | `string` | AWS region for the provider. | — |
| `iam_role_name` | `string` | Friendly name of the IAM role. | — |
| `iam_role_path` | `string` | Path to the IAM role. | — |
| `iam_role_description` | `string` | Description of the IAM role. | — |
| `iam_role_assume_role_policy` | `string` | JSON-encoded assume role policy document for the IAM role. | — |
| `iam_role_max_session_duration` | `number` | Maximum session duration in seconds for the IAM role. | — |
| `iam_role_attached_policy_arns` | `map(object({ arn = string }))` | Map of managed policy ARNs to attach to the IAM role. | `{}` |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `role_name` | Name of the IAM role. |
| `role_arn` | ARN of the IAM role. |

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