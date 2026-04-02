# s3-backend-storage

S3 bucket for private runner storage backend

## Overview

This Terraform stack manages an S3 bucket configured with encryption and public access blocking for use as a private runner storage backend.

## Modules

### s3_bucket

Manages S3 bucket with encryption and public access blocking

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_ownership_controls` - Enforces bucket owner ownership
- `aws_s3_bucket_public_access_block` - Blocks all public access
- `aws_s3_bucket_server_side_encryption_configuration` - Enables AES256 encryption

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | - |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- The bucket is configured with BucketOwnerEnforced ownership
- All public access is blocked by default
- Server-side encryption uses AES256 algorithm
- Bucket key is disabled for encryption