# aws-service-role-for-support

## Description

AWS Service Role for Support that enables resource access for AWS to provide billing, administrative and support services.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | Manages the AWSServiceRoleForSupport IAM role |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region |
| `iam_role_name` | `string` | Friendly name of the IAM role |
| `iam_role_path` | `string` | Path to the IAM role |
| `iam_role_description` | `string` | Description of the IAM role |
| `iam_role_assume_role_policy` | `string` | Policy that grants an entity permission to assume the role (JSON string) |
| `iam_role_max_session_duration` | `number` | Maximum session duration in seconds for the IAM role |

## Outputs Reference

| Name | Description |
|------|-------------|
| `iam_role_arn` | Amazon Resource Name (ARN) of the IAM role |
| `iam_role_name` | Name of the IAM role |
| `iam_role_unique_id` | Stable and unique string identifying the IAM role |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
sh imports.sh terraform
# or for OpenTofu:
sh imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```