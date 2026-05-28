# GCP Project IAM Stack

## Description

Manages GCP project IAM policy, audit config, organization policy, and service account keys for project `597595105496`.

This stack provides authoritative management of:
- The full IAM policy for the GCP project (all role bindings)
- IAM audit configuration for all services (ADMIN_READ, DATA_READ, DATA_WRITE)
- Organization policy constraint to disable service account API key creation
- System-managed service account keys

---

## Module Overview

| Module | Description |
|--------|-------------|
| `project_iam_policy` | Manages the authoritative IAM policy for the GCP project |
| `project_iam_audit_config` | Manages the IAM audit configuration for all services |
| `project_organization_policy` | Manages the organization policy constraint for disabling service account API key creation |
| `service_account_key` | Manages system-managed service account keys (called with `for_each`) |

---

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | `string` | The GCP region for the provider |
| `project` | `string` | The GCP project ID |
| `policy_data` | `string` | The IAM policy data (JSON) containing all bindings |
| `audit_config_service` | `string` | The service for which audit logging is configured |
| `audit_log_config_admin_read` | `string` | Log type for admin read audit logs |
| `audit_log_config_data_read` | `string` | Log type for data read audit logs |
| `audit_log_config_data_write` | `string` | Log type for data write audit logs |
| `org_policy_constraint` | `string` | The organization policy constraint name |
| `service_account_keys` | `map(object({...}))` | Map of service account key instances to manage |

---

## Outputs Reference

| Output | Description |
|--------|-------------|
| `project_iam_policy_etag` | The etag of the project IAM policy |
| `audit_config_service` | The service for which audit logging is configured |
| `org_policy_etag` | The etag of the organization policy |

---

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