# iam-policy-all

## Description

IAM policy granting full access to all AWS resources.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_policy` | Manages the IAM policy with full access permissions |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | string | AWS region |
| `iam_policy_name` | string | Name of the IAM policy |
| `iam_policy_path` | string | Path in which to create the IAM policy |
| `iam_policy_document` | string | JSON-formatted IAM policy document |

## Outputs Reference

| Name | Description |
|------|-------------|
| `iam_policy_arn` | ARN of the IAM policy |
| `iam_policy_id` | Policy ID of the IAM policy |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
sh imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```