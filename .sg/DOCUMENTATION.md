# S3 Bucket Infrastructure

## Overview

This Terraform stack manages S3 bucket resources in AWS. The infrastructure is organized into a modular structure for maintainability and reusability.

## Stack Information

- **Name**: s3-bucket-infrastructure
- **Description**: Manages S3 bucket resources
- **Region**: us-east-1

## Module Overview

### s3_bucket

Manages S3 bucket

**Location**: `modules/s3_bucket/`

**Resources**:
- `aws_s3_bucket.this` - S3 bucket resource

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | us-east-1 |

### Module: s3_bucket

| Name | Type | Description | Default |
|------|------|-------------|---------|
| bucket_name | string | Name of the S3 bucket | - |

## Outputs

### Root Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |

### Module: s3_bucket

| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Existing S3 bucket: `aksljdfhlkjasdhflkjashdflhasdlkjf-count-0`

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

   After import, this should show no changes (zero drift).

4. **Apply Configuration**

   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Module Usage Example

```hcl
module "bucket" {
  source = "./modules/s3_bucket"

  bucket_name = "aksljdfhlkjasdhflkjashdflhasdlkjf-count-0"
}
```

## Notes

- This stack imports existing AWS resources
- The goal is zero drift - `terraform plan` should show no changes after import
- All sensitive values should be managed through secure variable mechanisms
- Never commit sensitive data to version control