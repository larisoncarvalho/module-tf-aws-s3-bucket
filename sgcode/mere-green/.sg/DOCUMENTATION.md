# GCP Project IAM Policy Stack

## Description

Manages the authoritative IAM policy for GCP project `597595105496`. This stack uses `google_project_iam_policy` which is an **authoritative** resource — it replaces the entire IAM policy for the project with the bindings defined here.

## Module Overview

| Module | Description |
|--------|-------------|
| `project_iam_policy` | Manages the authoritative IAM policy for GCP project 597595105496 |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | The GCP region (set to `global`) |
| `project` | `string` | The GCP project ID to apply the IAM policy to |
| `bindings` | `list(object)` | List of IAM role bindings to apply to the project |

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

## ⚠️ Important Notes

- `google_project_iam_policy` is **authoritative**: it will overwrite all existing IAM bindings not listed in `var.bindings`.
- Always run `plan` before `apply` to verify no unintended changes.
- The `etag` output can be used to detect out-of-band changes to the IAM policy.