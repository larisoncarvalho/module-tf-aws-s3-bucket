# amazonsagemaker-execution-policy

## Description

IAM policy for AmazonSageMaker execution role granting S3 access.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_policy` | Manages the AmazonSageMaker execution IAM policy |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region |
| `iam_policy_name` | `string` | Name of the IAM policy |
| `iam_policy_path` | `string` | Path in which to create the policy |
| `iam_policy_policy` | `string` | JSON formatted policy document |

## Outputs Reference

| Name | Description |
|------|-------------|
| `iam_policy_arn` | ARN of the IAM policy |
| `iam_policy_policy_id` | Policy ID of the IAM policy |

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