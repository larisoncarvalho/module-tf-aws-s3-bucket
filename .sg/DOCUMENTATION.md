# ACM Certificate Stack - acm-certificate-qa-stackguardian

## Description

ACM certificate for *.int.qa.stackguardian.io domain with DNS validation

## Architecture

This stack manages an AWS Certificate Manager (ACM) certificate for wildcard and apex domain validation.

### Modules

#### acm_certificate

Manages ACM certificate for wildcard and apex domain

**Resources:**
- `aws_acm_certificate.this` - ACM certificate resource

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | - |

### Module: acm_certificate

| Name | Type | Description | Default |
|------|------|-------------|---------|
| domain_name | string | Primary domain name for the certificate | - |
| subject_alternative_names | list(string) | Additional domain names to include in the certificate | - |
| validation_method | string | Method to use for domain validation (DNS or EMAIL) | - |

## Outputs

### Root Outputs

| Name | Description |
|------|-------------|
| certificate_arn | ARN of the ACM certificate |
| domain_validation_options | Domain validation options for the certificate |

### Module: acm_certificate

| Name | Description |
|------|-------------|
| certificate_arn | ARN of the ACM certificate |
| domain_validation_options | Domain validation options for the certificate |
| status | Status of the certificate |

## Usage

### Initial Setup

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Verify Configuration:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```
   
   This should show no changes if the import was successful.

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Configuration

The stack is configured via `environments/terraform.tfvars`. The certificate is configured for:
- Primary domain: `*.int.qa.stackguardian.io`
- Subject alternative name: `int.qa.stackguardian.io`
- Validation method: DNS
- Region: eu-central-1

### Validation

After applying, you'll need to complete DNS validation by creating the CNAME records shown in the `domain_validation_options` output in your DNS provider.

## Notes

- This stack imports an existing ACM certificate
- DNS validation requires manual CNAME record creation in Route53 or your DNS provider
- The certificate covers both the wildcard domain and the apex domain