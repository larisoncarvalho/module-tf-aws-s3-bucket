# S3 Bucket Infrastructure

## Overview

This Terraform stack manages an S3 bucket with comprehensive security and encryption configuration. The infrastructure includes public access blocking, server-side encryption, ownership controls, and versioning settings.

## Stack Description

**Name:** s3-bucket-infrastructure  
**Region:** eu-central-1

This stack provisions a secure S3 bucket with the following features:
- Public access blocking to prevent accidental exposure
- Server-side encryption with AES256
- Bucket ownership controls
- Versioning configuration

## Modules

### s3_bucket

**Description:** Manages S3 bucket with public access block and server-side encryption

**Resources:**
- `aws_s3_bucket` - Primary S3 bucket
- `aws_s3_bucket_public_access_block` - Public access blocking configuration
- `aws_s3_bucket_server_side_encryption_configuration` - Encryption settings
- `aws_s3_bucket_ownership_controls` - Object ownership controls
- `aws_s3_bucket_versioning` - Versioning configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | eu-central-1 |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The ID of the S3 bucket |
| bucket_arn | The ARN of the S3 bucket |

## Module: private_runner_storage

This module instance creates a private storage bucket for runner backends with the following configuration:

- **Bucket Name:** 9ghvs69l-private-runner-storage-backend
- **Public Access:** Fully blocked (all public access settings enabled)
- **Encryption:** AES256 server-side encryption
- **Bucket Key:** Disabled
- **Object Ownership:** BucketOwnerEnforced
- **Versioning:** Disabled

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

Before running plan or apply, import the existing S3 bucket and its configurations:

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

## Import Details

This stack is designed to import existing S3 bucket resources. The import script will import:
- The S3 bucket itself
- Public access block configuration
- Server-side encryption configuration
- Ownership controls
- Versioning configuration

After import, `terraform plan` should show zero changes, indicating the configuration matches the existing infrastructure.

## Security Considerations

- All public access to the bucket is blocked by default
- Server-side encryption is enforced using AES256
- Object ownership is set to BucketOwnerEnforced for simplified ACL management
- Versioning can be enabled by changing the `versioning_status` parameter

## Notes

- The bucket name includes a unique prefix (9ghvs69l) to ensure global uniqueness
- Bucket key is disabled for this configuration
- Versioning is currently disabled but can be enabled if needed