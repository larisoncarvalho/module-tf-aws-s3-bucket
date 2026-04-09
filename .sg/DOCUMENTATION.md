# acm-certificate-int-qa-stackguardian

ACM certificate for *.int.qa.stackguardian.io domain

## Overview

This stack manages an AWS ACM certificate for the int.qa.stackguardian.io domain with wildcard support.

## Modules

### acm_certificate

Manages ACM certificate for int.qa.stackguardian.io

**Resources:**
- `aws_acm_certificate.this` - ACM certificate with DNS validation

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | - |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arn | ARN of the ACM certificate |
| certificate_domain | Domain name of the certificate |
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

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Certificate Details

- **Primary Domain:** *.int.qa.stackguardian.io
- **Subject Alternative Names:**
  - *.int.qa.stackguardian.io
  - int.qa.stackguardian.io
- **Validation Method:** DNS
- **Region:** eu-central-1