# API Gateway Infrastructure

## Overview

This stack manages API Gateway REST API infrastructure in AWS.

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
| api_id | API Gateway REST API ID |
| api_created_date | API Gateway REST API creation date |

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
terraform plan -var-file=environments/sg.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/sg.tfvars
```

## Region

This stack is configured for the `eu-central-1` region.