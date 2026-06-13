# new-bucket-2703-stack

## Description

S3 bucket with server-side encryption and public access block configuration.

## Stack Overview

This stack provisions an Amazon S3 bucket in the `eu-central-1` region using a modular Terraform structure.

## Module Overview

| Module | Source | Description |
|--------|--------|-------------|
| `s3_bucket` | `./modules/s3_bucket` | Manages the S3 bucket resource |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_s3_bucket` | `this` | The S3 bucket |

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

### 2. Import Existing Resources

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