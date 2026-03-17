# Private Runner Storage Infrastructure

## Overview

This Terraform stack manages S3 bucket infrastructure for private runner storage backend in the `eu-central-1` region. The configuration includes encryption, ownership controls, and public access blocking to ensure secure storage.

## Architecture

The stack consists of a single reusable S3 bucket module that creates:

- S3 bucket with custom naming
- Bucket ownership controls (BucketOwnerEnforced)
- Server-side encryption (AES256)
- Public access blocking (all options enabled)

## Modules

### s3_bucket

Manages an S3 bucket with security best practices including encryption and public access blocking.

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_ownership_controls` - Enforces bucket owner ownership
- `aws_s3_bucket_server_side_encryption_configuration` - Enables AES256 encryption
- `aws_s3_bucket_public_access_block` - Blocks all public access

**Inputs:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| bucket_name | string | Name of the S3 bucket | Yes |

**Outputs:**

| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |

## Root Configuration

### Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the infrastructure | eu-central-1 |

### Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the private runner storage bucket |
| bucket_arn | ARN of the private runner storage bucket |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Existing S3 bucket: `7ungwu6v-private-runner-storage-backend`

### Deployment Steps

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review Changes:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Post-Import Verification

After running the import script, verify that no changes are detected:

```bash
terraform plan -var-file=environments/terraform.tfvars
```

The output should show: `No changes. Your infrastructure matches the configuration.`

## Security Features

- **Encryption at Rest:** AES256 server-side encryption enabled
- **Public Access:** All public access blocked at bucket level
- **Ownership Controls:** BucketOwnerEnforced to prevent ACL-based access
- **Bucket Key:** Disabled for standard encryption behavior

## Notes

- This configuration imports existing infrastructure and should show zero drift after import
- The bucket name is hardcoded as it's environment-specific and not intended to be changed
- All security settings match the existing bucket configuration to prevent drift