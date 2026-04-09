# API Gateway Infrastructure

## Overview

This Terraform stack manages an API Gateway REST API configuration in AWS.

## Stack Information

- **Name**: api-gateway-infrastructure
- **Description**: API Gateway REST API configuration
- **Region**: eu-central-1

## Modules

### api_gateway_rest_api

Manages API Gateway REST API

**Resources:**
- `aws_api_gateway_rest_api.this`

**Variables:**

| Name | Type | Description |
|------|------|-------------|
| api_name | string | Name of the API Gateway REST API |
| api_key_source | string | Source of the API key for requests |
| binary_media_types | list(string) | List of binary media types supported by the API |

**Outputs:**

| Name | Description |
|------|-------------|
| api_id | ID of the API Gateway REST API |
| created_date | Creation date of the API Gateway REST API |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | eu-central-1 |

## Root Outputs

| Name | Description |
|------|-------------|
| api_id | ID of the API Gateway REST API |
| created_date | Creation date of the API Gateway REST API |

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

## Module Calls

The root module instantiates the following modules:

- **api_gateway** (`./modules/api_gateway_rest_api`): Configured with API name "sg-api-qa", API key source "HEADER", and binary media type "application/octet-stream"