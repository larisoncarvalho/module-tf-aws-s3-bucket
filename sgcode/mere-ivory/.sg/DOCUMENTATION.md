# gcp-project-iam-policy-597595105496

## Description

Google Cloud project-level IAM policy for project 597595105496 managing all role bindings across service accounts and users. This stack manages the authoritative IAM policy using `google_project_iam_policy`, which means it is the single source of truth for all IAM bindings on the project.

## Module Overview

| Module | Description |
|--------|-------------|
| `project_iam_policy` | Manages the authoritative IAM policy for GCP project 597595105496 |

## Resources

| Resource Type | Name | Description |
|---------------|------|-------------|
| `google_project_iam_policy` | `this` | Authoritative IAM policy for the GCP project |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | The region for the stack (global) |
| `project` | `string` | The GCP project ID to apply the IAM policy to |
| `policy_data` | `string` | The policy data JSON string representing all IAM bindings |

## Outputs Reference

| Name | Description |
|------|-------------|
| `etag` | The etag of the project IAM policy |

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

## Notes

- This stack uses `google_project_iam_policy` which is **authoritative** — it will overwrite any IAM bindings not present in `policy_data`.
- The `policy_data` variable contains the full JSON representation of all IAM bindings for the project.
- Modifying `policy_data` without including all existing bindings will remove those bindings from the project.