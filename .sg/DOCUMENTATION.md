# ACM Certificate QA Stack

## Description

ACM certificate for *.int.qa.stackguardian.io with DNS validation

## Architecture

This stack manages an AWS ACM certificate with DNS validation for the QA environment.

### Modules

#### acm_certificate

Manages ACM certificate and DNS validation options

**Resources:**
- `aws_acm_certificate.this` - ACM certificate for the domain
- `aws_acm_certificate_validation.this` - Certificate validation resource

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | - |

### Module: acm_certificate

| Name | Type | Description | Default |
|------|------|-------------|---------|
| domain_name | string | Primary domain name for the certificate | - |
| subject_alternative_names | list(string) | Subject alternative names for the certificate | - |
| validation_method | string | Certificate validation method | - |
| validation_record_fqdns | list(string) | DNS validation record FQDNs for certificate validation | - |
| tags | map(string) | Resource tags | - |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arn | ARN of the ACM certificate |
| domain_validation_options | Domain validation options for the certificate |

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

3. **Review Changes:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Configuration

The certificate is configured for:
- Primary domain: `*.int.qa.stackguardian.io`
- Subject alternative names: `*.int.qa.stackguardian.io`, `int.qa.stackguardian.io`
- Validation method: DNS
- Region: eu-central-1

### Notes

- The certificate uses DNS validation
- Validation record FQDNs must be created in Route53 or your DNS provider
- The certificate validation resource waits for DNS records to be validated
- Tags are applied for resource tracking