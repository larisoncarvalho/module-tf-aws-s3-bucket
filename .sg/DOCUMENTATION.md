# gcp-iam-project-policy-stack

## Description

Manages GCP project IAM policy, audit config, organization policy, and service account keys for project `597595105496`.

---

## Module Overview

| Module | Description |
|--------|-------------|
| `project_iam_policy` | Manages the project-level IAM policy bindings for GCP project 597595105496 |
| `project_iam_audit_config` | Manages the project-level IAM audit configuration for all services |
| `project_organization_policy` | Manages the organization policy constraint for disabling service account API key creation |
| `service_account_key` | Manages system-managed service account keys (supports multiple keys via `for_each`) |

---

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | `string` | The GCP region for the provider |
| `project` | `string` | The GCP project ID |
| `policy_data` | `string` | The IAM policy data JSON |
| `audit_config_service` | `string` | The service to apply audit logging for |
| `audit_log_config_admin_read` | `string` | Log type for admin read audit logs |
| `audit_log_config_data_read` | `string` | Log type for data read audit logs |
| `audit_log_config_data_write` | `string` | Log type for data write audit logs |
| `org_policy_constraint` | `string` | The constraint identifier for the organization policy |
| `service_account_keys` | `map(object({...}))` | Map of service account keys to manage, keyed by logical name |

---

## Outputs Reference

| Output | Description |
|--------|-------------|
| `project_iam_policy_etag` | The etag of the project IAM policy |
| `project_iam_audit_config_service` | The service the audit config applies to |
| `project_organization_policy_etag` | The etag of the organization policy |
| `service_account_key_ids` | Map of key IDs for each managed service account key |

---

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

---

## Notes

- The `service_account_key` module uses `for_each` over the `service_account_keys` map. Each instance is addressed as `module.service_account_key["<key>"]`.
- The `policy_data` variable contains the full IAM policy JSON. Update it carefully to avoid unintended permission changes.
- No backend configuration is included. Configure remote state separately as needed.