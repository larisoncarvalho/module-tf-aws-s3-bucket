# platform-api-dev

API Gateway REST API for platform-api-dev

## Overview

This Terraform stack manages an AWS API Gateway REST API named `platform-api-dev`. The API was created automatically by Zappa and is configured with binary media type support and compression settings.

## Modules

### api_gateway_rest_api

Manages the platform-api-dev REST API.

**Resources:**
- `aws_api_gateway_rest_api.this` - The REST API resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Outputs

| Name | Description |
|------|-------------|
| api_id | The ID of the platform-api-dev REST API |
| api_arn | The ARN of the platform-api-dev REST API |

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

## Configuration

The REST API is configured with:
- API key source: HEADER
- Binary media types: */*
- Minimum compression size: 0 bytes
- CloudFormation stack tags for traceability
- Zappa project identification

## Region

This stack is deployed in the `eu-central-1` region.