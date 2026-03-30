# s3-private-runner-storage

S3 bucket for private runner storage backend with encryption and public access blocking

## Overview

This Terraform stack manages an S3 bucket configured for private runner storage with the following security features:

- Server-side encryption using AES256
- Complete public access blocking
- Bucket owner enforced ownership controls
- Versioning disabled

## Architecture

### Modules

#### s3_bucket

Manages S3 bucket with server-side encryption and public access controls

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_server_side_encryption_configuration` - Encryption configuration
- `aws_s3_bucket_public_access_block` - Public access blocking
- `aws_s3_bucket_ownership_controls` - Ownership controls
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

- **Encryption**: AES256 server-side encryption enabled
- **Public Access**: All public access blocked at bucket level
- **Ownership**: BucketOwnerEnforced ownership controls
- **Versioning**: Disabled to reduce storage costs

## Region

This stack is deployed in the **eu-central-1** region.