# stulyze-iam-roles

## Description

IAM roles for Stulyze SMS Cognito integration and Django Zappa Lambda execution.

This stack manages two AWS IAM roles:
- **stulyze-sms**: A service role for Amazon Cognito IDP with an external ID condition, used for SMS integration.
- **stulyze-django-dev-ZappaLambdaExecutionRole**: A Lambda execution role for the Zappa-deployed Django application, granting broad permissions for API Gateway, Lambda, and supporting AWS services.

## Module Overview

| Module | Source | Description |
|--------|--------|-------------|
| `iam_role` | `./modules/iam_role` | Manages an AWS IAM role with optional inline policies and managed policy ARNs. Called once per entry in `var.iam_roles` via `for_each`. |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region to deploy resources |
| `iam_roles` | `map(object({...}))` | Map of IAM roles to create, keyed by logical name |

### `iam_roles` object fields

| Field | Type | Description |
|-------|------|-------------|
| `name` | `string` | Friendly name of the IAM role |
| `path` | `string` | Path to the IAM role |
| `assume_role_policy` | `string` | JSON trust policy document |
| `max_session_duration` | `number` | Maximum session duration in seconds (3600–43200) |
| `force_detach_policies` | `bool` | Whether to force-detach policies before destroy |
| `managed_policy_arns` | `list(string)` | Managed policy ARNs to attach |
| `inline_policy` | `list(object({name, policy}))` | Inline policies to attach |

## Outputs Reference

| Name | Description |
|------|-------------|
| `stulyze_sms_arn` | ARN of the stulyze-sms IAM role |
| `stulyze_sms_unique_id` | Unique ID of the stulyze-sms IAM role |
| `stulyze_django_dev_zappa_lambda_execution_role_arn` | ARN of the ZappaLambdaExecutionRole |
| `stulyze_django_dev_zappa_lambda_execution_role_unique_id` | Unique ID of the ZappaLambdaExecutionRole |

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