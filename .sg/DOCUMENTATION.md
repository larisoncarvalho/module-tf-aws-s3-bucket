# arunim-test-api-gateway

API Gateway REST API infrastructure

## Overview

This stack manages an API Gateway REST API in AWS. It provisions a single REST API resource with configurable name and API key source.

## Modules

### api_gateway_rest_api

Manages API Gateway REST API

**Resources:**
- `aws_api_gateway_rest_api.this` - REST API resource

**Variables:**
| Name | Type | Description |
|------|------|-------------|
| api_name | string | Name of the API Gateway REST API |
| api_key_source | string | Source of the API key for requests |

**Outputs:**
| Name | Description |
|------|-------------|
| api_id | ID of the API Gateway REST API |
| api_arn | ARN of the API Gateway REST API |
| root_resource_id | Root resource ID of the API Gateway REST API |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | eu-central-1 |

## Root Outputs

| Name | Description |
|------|-------------|
| api_id | ID of the API Gateway REST API |
| api_arn | ARN of the API Gateway REST API |

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
terraform plan -var-file environments/sg.tfvars
```

### Apply

```bash
terraform apply -var-file environments/sg.tfvars
```