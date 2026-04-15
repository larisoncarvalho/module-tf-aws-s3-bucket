# s3-private-runner-storage

S3 bucket for private runner storage backend

## Overview

This Terraform stack manages an S3 bucket used as a storage backend for private runners. The infrastructure consists of a single module that creates and manages the S3 bucket resource.

## Modules

### s3_bucket

Manages S3 bucket for private runner storage

**Location:** `modules/s3_bucket/`

**Resources:**
- `aws_s3_bucket.this` - S3 bucket for private runner storage

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | - |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the private runner storage bucket |
| bucket_arn | ARN of the private runner storage bucket |

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

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Module Details

#### s3_bucket Module

**Inputs:**
| Name | Type | Description |
|------|------|-------------|
| bucket_name | string | Name of the S3 bucket |

**Outputs:**
| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |

## Notes

- The bucket name is hardcoded to `7ungwu6v-private-runner-storage-backend`
- This stack imports an existing S3 bucket rather than creating a new one
- After import, Terraform will manage the bucket configuration going forward