# ACM Certificate Stack - acm-certificate-int-qa-stackguardian

## Description

ACM certificate for *.int.qa.stackguardian.io domain

## Region

eu-central-1

## Modules

### acm_certificate

Manages ACM certificate for int.qa.stackguardian.io

**Resources:**
- `aws_acm_certificate.this` - ACM certificate resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the stack | - |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arn | ARN of the ACM certificate |
| certificate_id | ID of the ACM certificate |
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

- **Primary Domain:** *.int.qa.stackguardian.io
- **Subject Alternative Names:** int.qa.stackguardian.io
- **Validation Method:** DNS
- **Certificate Transparency Logging:** ENABLED

## Notes

This stack imports an existing ACM certificate. After import, `terraform plan` should show no changes, indicating zero drift from the existing infrastructure.