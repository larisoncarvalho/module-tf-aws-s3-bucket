# ACM Certificate Stack

## Description

ACM certificate for *.int.qa.stackguardian.io domain

## Region

eu-central-1

## Modules

### acm_certificate

Manages ACM certificate for int.qa.stackguardian.io

**Resources:**
- `aws_acm_certificate.this`

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arn | ARN of the ACM certificate |
| certificate_domain_name | Domain name of the certificate |
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

## Module Details

### acm_certificate

Creates an ACM certificate with DNS validation for the int.qa.stackguardian.io domain and its wildcard subdomain.

**Inputs:**
- `domain_name`: Primary domain name
- `subject_alternative_names`: List of SANs
- `validation_method`: Validation method (DNS)
- `tags`: Resource tags

**Outputs:**
- `certificate_arn`: Certificate ARN
- `domain_name`: Certificate domain name
- `status`: Certificate status