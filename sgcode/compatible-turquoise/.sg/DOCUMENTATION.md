# sagemaker-service-catalog-cloudformation-role

## Description

IAM role granting CloudFormation permissions within the Amazon SageMaker Service Catalog portfolio, with an attached AWS managed policy.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AmazonSageMakerServiceCatalogProductsCloudformationRole IAM role and its managed policy attachment. |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_iam_role` | `this` | The IAM role for SageMaker Service Catalog CloudFormation operations. |
| `aws_iam_role_policy_attachment` | `this` | Attaches managed policies to the IAM role. |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region for the provider. |
| `name` | `string` | Friendly name of the IAM role. |
| `path` | `string` | Path to the IAM role. |
| `description` | `string` | Description of the IAM role. |
| `assume_role_policy` | `string` | JSON-encoded assume-role policy document. |
| `max_session_duration` | `number` | Maximum session duration in seconds for the IAM role. |
| `attached_policy_arns` | `map(object({ arn = string }))` | Map of managed policy ARNs to attach to the IAM role. |

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

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```