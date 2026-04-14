# stulyze-sms-iam-role

## Description

IAM role for Cognito SMS service with managed policy attachment. This stack manages the `stulyze-sms` IAM role used by Amazon Cognito IdP and attaches the required managed policy.

## Module Overview

| Module | Source | Description |
|--------|--------|-------------|
| `iam_role` | `./modules/iam_role` | Manages the stulyze-sms IAM role for Cognito IdP and its managed policy attachment |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_iam_role` | `this` | IAM role for Cognito SMS service |
| `aws_iam_role_policy_attachment` | `this` | Managed policy attachment(s) for the IAM role |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region | — |
| `iam_role_name` | `string` | Friendly name of the IAM role | — |
| `iam_role_path` | `string` | Path to the IAM role | — |
| `iam_role_max_session_duration` | `number` | Maximum session duration in seconds | — |
| `iam_role_assume_role_policy` | `string` | JSON-encoded assume role policy document | — |
| `iam_role_attached_policy_arns` | `map(object({ arn = string }))` | Map of managed policy ARNs to attach | `{}` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `iam_role_name` | Name of the IAM role |
| `iam_role_arn` | ARN of the IAM role |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

```sh
./imports.sh terraform
# or with OpenTofu:
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