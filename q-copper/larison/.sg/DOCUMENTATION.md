# s3-backend-storage

S3 bucket for private runner storage backend with encryption and public access blocking

## Overview

This Terraform stack manages an S3 bucket configured for secure private runner storage. The bucket includes server-side encryption with AES256, comprehensive public access blocking, and bucket ownership controls.

## Architecture

The stack consists of a single module that provisions:

- **S3 Bucket**: Primary storage bucket
- **Server-Side Encryption**: AES256 encryption configuration
- **Public Access Block**: Complete public access restrictions
- **Ownership Controls**: BucketOwnerEnforced object ownership

## Module: s3_bucket

Manages S3 bucket with server-side encryption and public access controls

### Resources

- `aws_s3_bucket.this` - Main S3 bucket
- `aws_s3_bucket_server_side_encryption_configuration.this` - Encryption configuration
- `aws_s3_bucket_public_access_block.this` - Public access restrictions
- `aws_s3_bucket_ownership_controls.this` - Object ownership settings

### Variables

| Name | Type | Description |
|------|------|-------------|
| bucket_name | string | Name of the S3 bucket |
| sse_algorithm | string | Server-side encryption algorithm |
| bucket_key_enabled | bool | Whether S3 Bucket Key is enabled |
| block_public_acls | bool | Whether to block public ACLs |
| block_public_policy | bool | Whether to block public bucket policies |
| ignore_public_acls | bool | Whether to ignore public ACLs |
| restrict_public_buckets | bool | Whether to restrict public bucket policies |
| object_ownership | string | Object ownership control setting |

### Outputs

| Name | Description |
|------|-------------|
| bucket_id | The ID of the S3 bucket |
| bucket_arn | The ARN of the S3 bucket |

## Root Configuration

### Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | eu-central-1 |

### Outputs

| Name | Description |
|------|-------------|
| bucket_id | The ID of the backend storage bucket |
| bucket_arn | The ARN of the backend storage bucket |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS provider ~> 5.0
- AWS credentials configured
- Existing S3 bucket: `37lxrdhe-private-runner-storage-backend`

### Deployment Steps

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Import Existing Resources**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review Changes**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Post-Import Verification

After importing, verify zero drift:
```bash
terraform plan -var-file=environments/terraform.tfvars
```

Expected output: `No changes. Your infrastructure matches the configuration.`

## Security Features

- **Encryption at Rest**: AES256 server-side encryption enabled
- **Public Access**: All public access vectors blocked
- **Ownership Controls**: BucketOwnerEnforced prevents ACL-based access
- **No Hardcoded Credentials**: All sensitive values parameterized

## Configuration Details

### Bucket Settings

- **Name**: 37lxrdhe-private-runner-storage-backend
- **Region**: eu-central-1
- **Encryption**: AES256 (S3-managed keys)
- **Bucket Key**: Disabled
- **Object Ownership**: BucketOwnerEnforced

### Public Access Block

All public access restrictions enabled:
- Block public ACLs: ✓
- Block public policies: ✓
- Ignore public ACLs: ✓
- Restrict public buckets: ✓

## Maintenance

### Updating Configuration

Modify values in `environments/terraform.tfvars` and apply:
```bash
terraform apply -var-file=environments/terraform.tfvars
```

### Destroying Resources

⚠️ **Warning**: This will delete the S3 bucket and all its contents.
```bash
terraform destroy -var-file=environments/terraform.tfvars
```