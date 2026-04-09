# ACM Certificate Stack - int.qa.stackguardian.io

## Overview

This stack manages an AWS Certificate Manager (ACM) certificate for the `int.qa.stackguardian.io` domain with wildcard support. The certificate is configured for DNS validation and deployed in the `eu-central-1` region.

## Stack Details

- **Name**: acm-certificate-int-qa-stackguardian
- **Region**: eu-central-1
- **Description**: ACM certificate for int.qa.stackguardian.io domain

## Modules

### acm_certificate

Manages ACM certificate for wildcard and apex domain.

**Resources:**
- `aws_acm_certificate.this` - ACM certificate with lifecycle management

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the resources | - |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arn | ARN of the ACM certificate |
| domain_validation_options | Domain validation options for the certificate |
| certificate_status | Status of the certificate |

## Usage

### Initialize

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

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Certificate Details

- **Primary Domain**: *.int.qa.stackguardian.io
- **Subject Alternative Names**:
  - *.int.qa.stackguardian.io
  - int.qa.stackguardian.io
- **Validation Method**: DNS
- **Tags**: Resource-Type = prod

## Notes

- The certificate uses DNS validation and requires DNS records to be created for validation
- The certificate has `create_before_destroy` lifecycle policy to prevent downtime during updates
- This stack imports an existing certificate with ARN: `arn:aws:acm:eu-central-1:790543352839:certificate/8f5ac570-f5eb-4346-b4f7-a7934c206bb5`