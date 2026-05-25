# gcp-project-iam-policy-597595105496

## Description

Google Cloud project-level IAM policy for project 597595105496 managing all role bindings.

This stack manages the authoritative IAM policy for GCP project `597595105496` using `google_project_iam_policy`, which is an **authoritative** resource — it replaces the entire IAM policy for the project on every apply.

## Module Overview

| Module | Description |
|--------|-------------|
| `project_iam_policy` | Manages the authoritative IAM policy for GCP project 597595105496 |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | The region for the stack |
| `project` | `string` | The GCP project ID to apply the IAM policy to |
| `bindings` | `list(object({role, members}))` | List of IAM role bindings to apply to the project |

## Outputs Reference

| Name | Description |
|------|-------------|
| `etag` | The etag of the project IAM policy |
| `policy_data` | The policy data of the project IAM policy |

## Usage Instructions

### 1. Initialize

```sh
tofu init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
./imports.sh tofu
```

### 3. Plan

```sh
tofu plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
tofu apply -var-file environments/sg.tfvars
```

## Notes

- `google_project_iam_policy` is **authoritative**: it will overwrite all existing IAM bindings on the project not listed in `var.bindings`.
- Ensure the service account running Terraform has `resourcemanager.projects.setIamPolicy` permission on the project.
- The `data.google_iam_policy` data source is used to construct the policy document from the list of bindings.