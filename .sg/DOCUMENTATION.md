# platform-api-dev

API Gateway REST API for platform-api-dev

## Overview

This Terraform stack manages an AWS API Gateway REST API resource in the `eu-central-1` region. The API was originally created by Zappa and is now managed through Terraform.

## Modules

### api_gateway_rest_api

Manages the platform-api-dev REST API.

**Resources:**
- `aws_api_gateway_rest_api.this` - The REST API resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for the stack | - |

## Outputs

| Name | Description |
|------|-------------|
| api_id | The ID of the REST API |
| created_date | The creation date of the REST API |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- This stack imports an existing API Gateway REST API
- The API was originally created by Zappa with CloudFormation tags
- After import, `terraform plan` should show no changes (zero drift)