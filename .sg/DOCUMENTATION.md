# S3 Backend Storage Stack

## Overview

This stack manages an S3 bucket configured for private runner storage backend with encryption and public access blocking enabled.

**Region:** eu-central-1

## Description

S3 bucket for private runner storage backend

## Architecture

The stack consists of a single module that creates and configures an S3 bucket with the following security features:

- Server-side encryption using AES256
- Bucket ownership controls enforced
- Public access completely blocked
- Secure defaults for private storage

## Modules

### s3_bucket

Manages S3 bucket with encryption and public access blocking

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_ownership_controls` - Enforces bucket owner ownership
- `aws_s3_bucket_server_side_encryption_configuration` - Enables AES256 encryption
- `aws_s3_bucket_public_access_block` - Blocks all public access

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the infrastructure | eu-central-1 |

### Module Variables (s3_bucket)

| Name | Type | Description | Required |
|------|------|-------------|----------|
| bucket_name | string | Name of the S3 bucket | Yes |

## Outputs

| Name | Description | Source |
|------|-------------|--------|
| bucket_id | The ID of the backend storage S3 bucket | module.backend_storage.bucket_id |
| bucket_arn | The ARN of the backend storage S3 bucket | module.backend_storage.bucket_arn |

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
   
   This should show no changes if the import was successful.

4. **Apply Configuration (if needed):**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Day-to-Day Operations

- **Check for drift:**
  ```bash
  terraform plan -var-file=environments/terraform.tfvars
  ```

- **View outputs:**
  ```bash
  terraform output
  ```

## Security Considerations

- The bucket is configured with server-side encryption using AES256
- All public access is blocked at the bucket level
- Bucket ownership is enforced to prevent ACL-based access
- No credentials are stored in the configuration files

## Notes

- The bucket name `7ungwu6v-private-runner-storage-backend` is hardcoded in the module call
- Bucket key is disabled for encryption configuration
- This configuration imports existing infrastructure and maintains zero drift