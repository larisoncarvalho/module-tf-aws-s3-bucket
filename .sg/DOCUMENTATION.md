# API Gateway Infrastructure

## Overview

This stack manages API Gateway REST API infrastructure in the eu-central-1 region.

## Modules

### api_gateway_rest_api

Manages API Gateway REST API resources.

**Resources:**
- `aws_api_gateway_rest_api.this` - API Gateway REST API

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Outputs

| Name | Description |
|------|-------------|
| api_id | ID of the API Gateway REST API |
| created_date | Creation date of the API Gateway REST API |

## Usage

### Initialize

```bash
tofu init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh tofu
```

### Plan

```bash
tofu plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
tofu apply -var-file=environments/terraform.tfvars
```

## Module Details

### sg_api_qa

API Gateway REST API instance configured with:
- Name: sg-api-qa
- API Key Source: HEADER
- Binary Media Types: application/octet-stream