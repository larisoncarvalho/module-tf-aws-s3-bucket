# s3-private-runner-storage

Private runner storage backend S3 bucket with encryption and public access blocking

## Overview

This Terraform stack manages an S3 bucket configured for private runner storage with comprehensive security controls including server-side encryption and public access blocking.

## Architecture

### Modules

#### s3_bucket

Manages S3 bucket with server-side encryption and public access controls

**Resources:**
- `aws_s3_bucket.this` - S3 bucket
- `aws_s3_bucket_ownership_controls.this` - Bucket ownership controls
- `aws_s3_bucket_public_access_block.this` - Public access block configuration
- `aws_s3_bucket_server_side_encryption_configuration.this` - Server-side encryption configuration

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the resources | eu-central-1 |

### Module Variables (s3_bucket)

| Name | Type | Description |
|------|------|-------------|
| bucket_name | string | Name of the S3 bucket |
| object_ownership | string | Object ownership control rule |
| block_public_acls | bool | Whether to block public ACLs |
| block_public_policy | bool | Whether to block public bucket policies |
| ignore_public_acls | bool | Whether to ignore public ACLs |
| restrict_public_buckets | bool | Whether to restrict public bucket policies |
| sse_algorithm | string | Server-side encryption algorithm |
| bucket_key_enabled | bool | Whether S3 Bucket Key is enabled |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The ID of the S3 bucket |
| bucket_arn | The ARN of the S3 bucket |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Security Features

- **Encryption at Rest**: AES256 server-side encryption enabled
- **Public Access Blocking**: All public access blocked via bucket policies and ACLs
- **Ownership Controls**: BucketOwnerEnforced ownership for consistent access control

## Region

This stack is deployed in the **eu-central-1** region.