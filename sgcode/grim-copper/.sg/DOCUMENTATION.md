# iam-policy-all

## Description

IAM policy granting full access to all AWS resources.

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_policy` | Manages the All IAM policy with full resource access |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | string | AWS region | — |
| `name` | string | Name of the IAM policy | — |
| `path` | string | Path in which to create the policy | — |
| `policy` | string | JSON-formatted IAM policy document | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| `arn` | ARN assigned by AWS to this policy |
| `policy_id` | Policy's ID |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
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