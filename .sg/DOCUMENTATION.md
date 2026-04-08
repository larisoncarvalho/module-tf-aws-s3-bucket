# S3 Bucket Infrastructure

## Overview

This stack manages an S3 bucket for CloudFormation templates with comprehensive security configurations including encryption, versioning, public access blocking, and ownership controls.

## Architecture

The stack consists of a single module that creates and configures an S3 bucket with the following security features:

- **Bucket Ownership Controls**: Enforces bucket owner ownership of objects
- **Public Access Block**: Prevents public access through ACLs and policies
- **Server-Side Encryption**: Enables AES256 encryption by default
- **Versioning**: Configurable versioning state

## Modules

### s3_bucket

Manages S3 bucket with security configurations.

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_ownership_controls` - Object ownership settings
- `aws_s3_bucket_public_access_block` - Public access restrictions
- `aws_s3_bucket_server_side_encryption_configuration` - Encryption settings
- `aws_s3_bucket_versioning` - Versioning configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

Or for OpenTofu:

```bash
./imports.sh tofu
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

- **Encryption at Rest**: AES256 server-side encryption enabled by default
- **Public Access Prevention**: All public access blocked via bucket policies and ACLs
- **Ownership Controls**: BucketOwnerEnforced ensures consistent ownership
- **Versioning**: Configurable versioning for object recovery

## Notes

- This configuration imports existing infrastructure with zero-drift design
- All security settings match the current state of the bucket
- No credentials or secrets are hardcoded in the configuration