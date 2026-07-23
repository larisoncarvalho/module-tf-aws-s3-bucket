# s3-bucket-test-1-2-9

## Description

S3 bucket with server-side encryption (AES256), versioning enabled, and custom ACL grant for canonical user.

## Module Overview

| Module | Description |
|--------|-------------|
| `s3_bucket` | Manages the S3 bucket with tags |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region where resources will be managed | — |
| `bucket` | `string` | Name of the S3 bucket | — |
| `tags` | `map(string)` | Tags to assign to the bucket | `{}` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `bucket_id` | The name of the S3 bucket |
| `bucket_arn` | The ARN of the S3 bucket |

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