# gcp-project-iam-stack

## Description

Manages GCP project IAM policy, audit config, organization policy, and service account keys for project 597595105496.

## Module Overview

| Module | Description |
|--------|-------------|
| `project_iam_policy` | Manages the project-level IAM policy bindings for GCP project 597595105496 |
| `project_iam_audit_config` | Manages the project-level IAM audit configuration for all services |
| `project_organization_policy` | Manages the organization policy constraint for disabling service account API key creation |
| `service_account_key` | Manages system-managed service account keys |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | `string` | The region for the stack |
| `project` | `string` | The GCP project ID |
| `policy_data` | `string` | The IAM policy data (JSON) containing all role bindings |
| `audit_config_service` | `string` | The service to apply audit logging for |
| `audit_log_config_admin_read` | `string` | Log type for admin read audit logs |
| `audit_log_config_data_read` | `string` | Log type for data read audit logs |
| `audit_log_config_data_write` | `string` | Log type for data write audit logs |
| `org_policy_constraint` | `string` | The organization policy constraint identifier |
| `service_account_keys` | `map(object({...}))` | Map of service account keys to manage |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `project_iam_policy_etag` | The etag of the project IAM policy |
| `project_iam_audit_config_service` | The service for which audit logging is configured |
| `project_organization_policy_etag` | The etag of the organization policy |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
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