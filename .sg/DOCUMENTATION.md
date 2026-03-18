# S3 Bucket Infrastructure

## Overview

This Terraform stack manages an S3 bucket with comprehensive security and versioning configuration. The infrastructure includes versioning, server-side encryption, public access blocking, and ownership controls.

## Stack Description

- **Name**: s3-bucket-infrastructure
- **Description**: S3 bucket with versioning and encryption
- **Region**: us-east-1

## Modules

### s3_bucket

Manages S3 bucket with security and versioning configuration.

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_versioning` - Bucket versioning configuration
- `aws_s3_bucket_server_side_encryption_configuration` - Server-side encryption settings
- `aws_s3_bucket_public_access_block` - Public access block configuration
- `aws_s3_bucket_ownership_controls` - Object ownership controls

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the infrastructure | us-east-1 |

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

## Module Details

### s3_bucket Module Variables

| Name | Type | Description |
|------|------|-------------|
| bucket_name | string | Name of the S3 bucket |
| versioning_status | string | Versioning status for the bucket |
| mfa_delete | string | MFA delete status for versioning |
| sse_algorithm | string | Server-side encryption algorithm |
| bucket_key_enabled | bool | Whether S3 Bucket Key is enabled |
| block_public_acls | bool | Whether to block public ACLs |
| block_public_policy | bool | Whether to block public bucket policies |
| ignore_public_acls | bool | Whether to ignore public ACLs |
| restrict_public_buckets | bool | Whether to restrict public bucket policies |
| object_ownership | string | Object ownership control setting |

### s3_bucket Module Outputs

| Name | Description |
|------|-------------|
| bucket_id | The ID of the S3 bucket |
| bucket_arn | The ARN of the S3 bucket |

## Security Features

- **Versioning**: Enabled with MFA delete protection option
- **Encryption**: Server-side encryption with AES256
- **Public Access**: All public access blocked by default
- **Ownership Controls**: BucketOwnerEnforced for consistent ownership

## Notes

This configuration imports existing S3 bucket resources. After import, `terraform plan` should show no changes, ensuring zero drift from the current state.