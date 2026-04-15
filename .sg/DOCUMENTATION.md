# orchestrator-resources-qa-s3

## Description

S3 bucket for orchestrator resources in QA environment with versioning, SSE-AES256 encryption, public access blocking, and bucket policy.

## Stack Overview

| Component | Details |
|-----------|---------|
| Stack Name | orchestrator-resources-qa-s3 |
| Region | eu-central-1 |
| Bucket | orchestrator-resources-qa |

## Module Overview

### `s3_bucket` (`./modules/s3_bucket`)

Manages the orchestrator-resources-qa S3 bucket with associated ACL grants, versioning, encryption, public access block, and bucket policy.

| Resource | Type | Description |
|----------|------|-------------|
| `aws_s3_bucket.this` | aws_s3_bucket | Primary S3 bucket |
| `aws_s3_bucket_acl.this` | aws_s3_bucket_acl | ACL with dual FULL_CONTROL grants |
| `aws_s3_bucket_versioning.this` | aws_s3_bucket_versioning | Versioning enabled, MFA delete disabled |
| `aws_s3_bucket_server_side_encryption_configuration.this` | aws_s3_bucket_server_side_encryption_configuration | SSE-AES256 encryption |
| `aws_s3_bucket_public_access_block.this` | aws_s3_bucket_public_access_block | All public access blocked |
| `aws_s3_bucket_policy.this` | aws_s3_bucket_policy | IAM principal access policy |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | string | AWS region where resources will be managed |
| `bucket` | string | Name of the S3 bucket |
| `acl_grant_owner_id` | string | Canonical user ID of the bucket owner granted FULL_CONTROL |
| `acl_grant_secondary_id` | string | Canonical user ID of the secondary grantee with FULL_CONTROL |
| `bucket_policy` | string | JSON bucket policy document granting s3:* to specified AWS principals |

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

- All public access is blocked on the bucket (block_public_acls, block_public_policy, ignore_public_acls, restrict_public_buckets all set to true)
- Versioning is enabled; once enabled it cannot be fully disabled, only suspended
- SSE-AES256 encryption is applied by default to all objects
- The bucket policy grants `s3:*` to four specific AWS principals across two accounts
- Two canonical users hold FULL_CONTROL ACL grants on the bucket