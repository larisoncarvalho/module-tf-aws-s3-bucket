# S3 Private Runner Storage

## Overview

This Terraform stack manages an S3 bucket for private runner storage backend with comprehensive security controls including encryption, public access blocking, and ownership controls.

**Region:** eu-central-1

## Architecture

The stack consists of a single module that provisions:

- S3 bucket with server-side encryption (AES256)
- Public access blocking at all levels
- Bucket ownership controls (BucketOwnerEnforced)
- Versioning configuration (disabled)

## Modules

### s3_bucket

Manages S3 bucket with encryption, public access blocking, and ownership controls.

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_server_side_encryption_configuration` - Encryption settings
- `aws_s3_bucket_public_access_block` - Public access restrictions
- `aws_s3_bucket_ownership_controls` - Object ownership rules
- `aws_s3_bucket_versioning` - Versioning configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | eu-central-1 |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the private runner storage bucket |
| bucket_arn | ARN of the private runner storage bucket |

## Usage

### Prerequisites

- Terraform installed (latest version)
- AWS credentials configured
- Existing S3 bucket: `9ghvs69l-private-runner-storage-backend`

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

After running the import script, verify zero drift:
```bash
terraform plan -var-file=environments/terraform.tfvars
```

The output should show "No changes" if the import was successful and the configuration matches the existing infrastructure.

## Security Features

- **Encryption at Rest:** AES256 server-side encryption enabled
- **Public Access:** All public access blocked (ACLs and policies)
- **Ownership Controls:** BucketOwnerEnforced for consistent object ownership
- **Versioning:** Disabled (can be enabled if needed)

## Notes

- This configuration imports existing infrastructure with zero-drift goal
- The bucket name is hardcoded as it's environment-specific
- All security settings match the existing bucket configuration
- No backend configuration is included - configure separately if needed