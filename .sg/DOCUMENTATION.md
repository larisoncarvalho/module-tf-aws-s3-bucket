# orchestrator-resources-qa

S3 bucket for orchestrator resources in QA environment

## Overview

This stack manages an S3 bucket with versioning, encryption, and public access controls for the orchestrator resources in the QA environment.

## Modules

### s3_bucket

Manages S3 bucket with versioning, encryption, and public access controls

**Resources:**
- `aws_s3_bucket.this` - Main S3 bucket
- `aws_s3_bucket_versioning.this` - Bucket versioning configuration
- `aws_s3_bucket_server_side_encryption_configuration.this` - Server-side encryption
- `aws_s3_bucket_public_access_block.this` - Public access block settings
- `aws_s3_bucket_policy.this` - Bucket policy for principal access
- `aws_s3_bucket_acl.this` - Bucket ACL configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Region

This stack is deployed in **eu-central-1**.