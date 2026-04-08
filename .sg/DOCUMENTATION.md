# ACM Certificate Stack - stackguardian.io

## Overview

This stack manages an ACM certificate for the stackguardian.io domain with wildcard SANs in the eu-central-1 region.

## Modules

### acm_certificate

Manages ACM certificate for stackguardian.io domain with DNS validation.

**Resources:**
- `aws_acm_certificate.this` - ACM certificate resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arn | ARN of the ACM certificate |
| domain_validation_options | Domain validation options for the certificate |

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

- **Primary Domain:** stackguardian.io
- **SANs:**
  - stackguardian.io
  - *.qa.stackguardian.io
  - *.stackguardian.io
- **Validation Method:** DNS
- **Tags:**
  - Resource-Type: prod
  - Name: sg