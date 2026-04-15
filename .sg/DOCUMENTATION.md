# API Gateway REST APIs Stack

## Overview

This Terraform stack manages API Gateway REST API resources for `sg-api-qa` and `platform-api-dev` in the `eu-central-1` region.

## Stack Description

API Gateway REST APIs for sg-api-qa and platform-api-dev

## Module Overview

### api_gateway_rest_api

Manages API Gateway REST API resources.

**Resources:**
- `aws_api_gateway_rest_api` - API Gateway REST API instances

## Variables Reference

| Name | Type | Description | Required |
|------|------|-------------|----------|
| region | string | AWS region for the resources | Yes |
| apis | map(object) | Map of API Gateway REST API configurations | Yes |

### apis Object Structure

| Field | Type | Description | Required |
|-------|------|-------------|----------|
| name | string | Name of the REST API | Yes |
| api_key_source | string | Source of the API key for requests | Yes |
| binary_media_types | list(string) | List of binary media types supported by the REST API | Yes |
| description | string | Description of the REST API | No |
| minimum_compression_size | number | Minimum response size to compress for the REST API | No |
| tags | map(string) | Tags to apply to the REST API | No |

## Outputs Reference

| Name | Description |
|------|-------------|
| api_ids | Map of API Gateway REST API IDs |
| api_arns | Map of API Gateway REST API ARNs |

## Usage Instructions

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### 3. Review Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

After import, this should show no changes (zero drift).

### 4. Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Managed APIs

- **sg-api-qa**: API Gateway REST API with application/octet-stream binary media type support
- **platform-api-dev**: Zappa-created API Gateway REST API with CloudFormation tags and */* binary media type support

## Notes

- Both APIs use HEADER as the API key source
- The platform-api-dev API has compression enabled (minimum size: 0 bytes)
- All resources are imported from existing AWS infrastructure