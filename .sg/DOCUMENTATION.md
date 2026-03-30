# S3 Static Website Stack

## Description

S3 bucket configured for public static website hosting

## Architecture

This stack provisions an S3 bucket with complete static website hosting configuration including:

- Public access configuration for website hosting
- Custom ACL with public read permissions
- Bucket policy for public access
- Server-side encryption (AES256)
- Website configuration with index and error documents

## Modules

### s3_bucket

Manages S3 bucket with static website hosting, public access, and encryption

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_ownership_controls` - Object ownership controls
- `aws_s3_bucket_public_access_block` - Public access block settings
- `aws_s3_bucket_acl` - Bucket ACL with public read access
- `aws_s3_bucket_policy` - Bucket policy for public access
- `aws_s3_bucket_server_side_encryption_configuration` - Encryption configuration
- `aws_s3_bucket_website_configuration` - Website hosting configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | eu-central-1 |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |
| website_endpoint | Website endpoint of the S3 bucket |

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

## Notes

- The bucket is configured for public website hosting with public read access
- Server-side encryption is enabled using AES256
- The website serves `index.html` as the index document and `error.html` for errors
- All public access blocks are disabled to allow website hosting