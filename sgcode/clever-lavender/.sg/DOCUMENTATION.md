# stackguardian-cosmic-penguin-s3

## Description

S3 bucket for hosting a static website with public-read ACL, CORS, server-side encryption, and website configuration.

## Module Overview

| Module | Description |
|--------|-------------|
| `s3_bucket` | Manages the S3 bucket and its configuration |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region where resources will be managed | — |
| `bucket` | `string` | Name of the S3 bucket | — |
| `force_destroy` | `bool` | Whether to force destroy the bucket and all objects when the bucket is destroyed | — |
| `object_lock_enabled` | `bool` | Whether object lock is enabled on the bucket | — |
| `tags` | `map(string)` | Tags to assign to the bucket | `{}` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `bucket_id` | The name of the S3 bucket |
| `bucket_arn` | The ARN of the S3 bucket |

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