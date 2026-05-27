# gcp-iam-project-policy-stack

## Description

Manages GCP project IAM policy, audit config, organization policy, and service account keys for project 597595105496.

## Module Overview

| Module | Description |
|--------|-------------|
| `project_iam_policy` | Manages the authoritative IAM policy for the GCP project |
| `project_iam_audit_config` | Manages the project-level IAM audit configuration for all services |
| `project_organization_policy` | Manages the organization policy constraint on the GCP project |
| `service_account_key` | Manages service account keys (system-managed) |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | `string` | The region for the stack |
| `project` | `string` | The GCP project ID |
| `policy_data` | `string` | The policy data JSON string containing all IAM bindings |
| `audit_config_service` | `string` | The service for which audit logging is configured |
| `audit_log_configs` | `list(object({ log_type = string }))` | List of audit log config blocks specifying log types |
| `org_policy_constraint` | `string` | The constraint identifier for the organization policy |
| `service_account_keys` | `map(object({ service_account_id = string, key_algorithm = string }))` | Map of service account keys to manage |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `project_iam_policy_etag` | The etag of the project IAM policy |
| `audit_config_service` | The service for which audit logging is configured |
| `org_policy_etag` | The etag of the project organization policy |
| `service_account_key_ids` | Map of service account key IDs |

## Usage Instructions

### 1. Initialize

```sh
terraform init
# or
tofu init
```

### 2. Import Existing Resources

```sh
chmod +x imports.sh
./imports.sh terraform
# or for OpenTofu
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
# or
tofu plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
# or
tofu apply -var-file environments/sg.tfvars
```

## Notes

- The `service_account_key` module uses `for_each` at the root level, so each key is managed as a separate module instance.
- The `project_iam_policy` resource is authoritative — it will overwrite any bindings not listed in `policy_data`.
- Ensure the credentials used have sufficient permissions to manage IAM policies, audit configs, organization policies, and service account keys on project `597595105496`.