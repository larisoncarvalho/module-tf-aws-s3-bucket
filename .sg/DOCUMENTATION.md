# ACM Certificates and API Gateway Stack

## Overview

This stack manages ACM certificates for stackguardian.io domains and an API Gateway REST API in the eu-central-1 region.

## Modules

### acm_certificate

Manages ACM certificates with domain validation options. Creates certificates with DNS validation and handles certificate validation.

**Resources:**
- `aws_acm_certificate` - ACM certificates for domains
- `aws_acm_certificate_validation` - Certificate validation resources

### api_gateway_rest_api

Manages an API Gateway REST API with configurable settings for binary media types, compression, and API key sources.

**Resources:**
- `aws_api_gateway_rest_api` - API Gateway REST API

## Variables

| Name | Type | Description |
|------|------|-------------|
| region | string | AWS region |
| certificates | map(object) | ACM certificates to create with validation configuration |

### Certificate Object Structure

Each certificate in the `certificates` map contains:
- `domain_name` - Primary domain name
- `subject_alternative_names` - List of SANs
- `validation_method` - Validation method (DNS)
- `key_algorithm` - Key algorithm (RSA_2048)
- `tags` - Resource tags
- `validation_record_fqdns` - DNS validation record FQDNs

## Outputs

| Name | Description |
|------|-------------|
| certificate_arns | ARNs of the ACM certificates |
| api_gateway_id | ID of the API Gateway REST API |

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

## Managed Resources

- ACM certificates for `*.int.qa.stackguardian.io` and `stackguardian.io` domains
- API Gateway REST API `platform-api-dev` created by Zappa