# s3-backend-storage

S3 bucket for private runner storage backend with encryption and public access blocking

## Architecture

This stack provisions a secure S3 bucket with the following security controls:

- **Bucket Ownership Controls**: Enforces bucket owner ownership of all objects
- **Public Access Block**: Blocks all public access at the bucket level
- **Server-Side Encryption**: Enables AES256 encryption for all objects

## Modules

### s3_bucket

Manages S3 bucket with security controls and encryption

**Resources:**
- `aws_s3_bucket` - Main S3 bucket
- `aws_s3_bucket_ownership_controls` - Ownership control settings
- `aws_s3_bucket_public_access_block` - Public access blocking configuration
- `aws_s3_bucket_server_side_encryption_configuration` - Encryption settings

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | eu-central-1 |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The ID of the backend storage S3 bucket |
| bucket_arn | The ARN of the backend storage S3 bucket |

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

- **Encryption at Rest**: All objects are encrypted using AES256
- **Public Access Prevention**: All public access is blocked at multiple levels
- **Bucket Owner Enforcement**: All objects are owned by the bucket owner
- **No Hardcoded Credentials**: All sensitive values must be provided via variables or environment

## Notes

This configuration imports existing S3 bucket resources. After import, `terraform plan` should show zero changes, indicating perfect drift alignment with the existing infrastructure.