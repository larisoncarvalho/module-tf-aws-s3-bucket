# config-bucket-790543352839

## Description

S3 bucket configured for AWS Config delivery with AES256 server-side encryption and a bucket policy granting Config service access.

## Module Overview

| Module | Description |
|--------|-------------|
| `s3_bucket` | Manages the AWS Config S3 bucket with encryption configuration |

## Resources

| Resource | Type | Description |
|----------|------|-------------|
| `aws_s3_bucket.this` | `aws_s3_bucket` | The S3 bucket used for AWS Config delivery |

## Variables

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region where resources are deployed |
| `bucket` | `string` | Name of the S3 bucket |

## Outputs

| Name | Description |
|------|-------------|
| `bucket_id` | ID of the S3 bucket |
| `bucket_arn` | ARN of the S3 bucket |

## Usage

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
./imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```