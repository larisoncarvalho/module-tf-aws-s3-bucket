# S3 Backend Storage

## Overview

This Terraform stack manages an S3 bucket configured for private runner storage backend with security best practices including encryption, public access blocking, and ownership controls.

**Region:** eu-central-1

## Architecture

The stack consists of a single module that provisions:

- S3 bucket with a fixed name
- Bucket ownership controls (BucketOwnerEnforced)
- Public access block configuration (all protections enabled)
- Server-side encryption with AES256

## Modules

### s3_bucket

Manages S3 bucket with encryption and public access blocking.

**Location:** `./modules/s3_bucket`

**Resources:**
- `aws_s3_bucket.this` - Main S3 bucket
- `aws_s3_bucket_ownership_controls.this` - Ownership controls
- `aws_s3_bucket_public_access_block.this` - Public access blocking
- `aws_s3_bucket_server_side_encryption_configuration.this` - Encryption configuration

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the infrastructure | "eu-central-1" |

### Module Variables (s3_bucket)

| Name | Type | Description | Required |
|------|------|-------------|----------|
| bucket_name | string | Name of the S3 bucket | Yes |

## Outputs

| Name | Description | Source |
|------|-------------|--------|
| bucket_id | ID of the backend storage bucket | module.backend_storage.bucket_id |
| bucket_arn | ARN of the backend storage bucket | module.backend_storage.bucket_arn |

## Usage

### Initial Setup

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Verify Configuration:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```
   
   This should show no changes if the import was successful and the configuration matches the existing infrastructure.

4. **Apply Changes (if needed):**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Day-to-Day Operations

- **Check for drift:** `terraform plan -var-file=environments/terraform.tfvars`
- **View outputs:** `terraform output`
- **Update configuration:** Modify the appropriate `.tf` files and run `terraform plan` then `terraform apply`

## Security Features

- **Encryption at rest:** AES256 server-side encryption enabled
- **Public access blocked:** All public access protections enabled
- **Ownership controls:** BucketOwnerEnforced to prevent ACL-based access
- **No hardcoded credentials:** All sensitive values should be provided via environment variables or AWS credentials configuration

## Notes

- The bucket name is hardcoded in the root module: `9ghvs69l-private-runner-storage-backend`
- This is an import-first configuration designed to manage existing infrastructure
- After successful import, `terraform plan` should show zero changes