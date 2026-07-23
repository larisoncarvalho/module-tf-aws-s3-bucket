# s3-bucket-my-s3-bucket

## Description

S3 bucket with server-side encryption, public access blocking, and object ownership controls.

## Module Overview

| Module | Description |
|--------|-------------|
| `s3_bucket` | Manages the S3 bucket and its server-side encryption configuration |

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
```

Or with OpenTofu:

```sh
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

## Resource Inventory

| Resource | Address |
|----------|---------|
| `aws_s3_bucket` | `module.s3_bucket.aws_s3_bucket.this` |