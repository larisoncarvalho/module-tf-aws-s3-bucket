# s3-bucket-test-1-1-3

## Description

S3 bucket with server-side encryption, versioning, and public access block configuration.

## Stack Overview

This stack manages an S3 bucket (`test-1-1-3`) in `eu-central-1` with the following features:

- **Versioning** – enabled via `aws_s3_bucket_versioning`
- **Server-side encryption** – AES256 via `aws_s3_bucket_server_side_encryption_configuration`
- **Public access block** – configurable via `aws_s3_bucket_public_access_block`
- **ACL** – fine-grained access control via `aws_s3_bucket_acl`

## Module Overview

### `modules/s3_bucket`

Manages the S3 bucket and its associated configurations.

| Resource | Type | Description |
|---|---|---|
| `aws_s3_bucket.this` | Primary | The S3 bucket |
| `aws_s3_bucket_versioning.this` | Child | Versioning configuration |
| `aws_s3_bucket_server_side_encryption_configuration.this` | Child | SSE configuration |
| `aws_s3_bucket_public_access_block.this` | Child | Public access block settings |
| `aws_s3_bucket_acl.this` | Child | ACL configuration |

## Variables Reference

| Name | Type | Description | Default |
|---|---|---|---|
| `region` | `string` | AWS region where resources will be managed | — |
| `bucket` | `string` | Name of the S3 bucket | — |
| `tags` | `map(string)` | Tags to assign to the bucket | — |
| `versioning_status` | `string` | Versioning state (Enabled or Suspended) | — |
| `versioning_mfa_delete` | `string` | MFA delete state (Enabled or Disabled) | — |
| `sse_algorithm` | `string` | SSE algorithm (AES256 or aws:kms) | — |
| `bucket_key_enabled` | `bool` | Whether to use S3 Bucket Keys for SSE-KMS | — |
| `block_public_acls` | `bool` | Whether to block public ACLs | — |
| `block_public_policy` | `bool` | Whether to block public bucket policies | — |
| `ignore_public_acls` | `bool` | Whether to ignore public ACLs | — |
| `restrict_public_buckets` | `bool` | Whether to restrict public bucket policies | — |
| `acl_grantee_id` | `string` | Canonical user ID of the ACL grantee | — |
| `acl_grantee_type` | `string` | Type of the ACL grantee | — |
| `acl_permission` | `string` | Permission granted to the grantee | — |
| `acl_owner_id` | `string` | Canonical user ID of the bucket owner | — |

## Outputs Reference

| Name | Description |
|---|---|
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