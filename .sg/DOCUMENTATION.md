# API Gateway Infrastructure

## Overview

This stack manages API Gateway REST API infrastructure in AWS.

## Modules

### api_gateway_rest_api

Manages API Gateway REST API resources.

**Resources:**
- `aws_api_gateway_rest_api.this` - REST API

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | - |

## Outputs

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

### Plan

```bash
terraform plan -var-file environments/sg.tfvars
```

### Apply

```bash
terraform apply -var-file environments/sg.tfvars
```

## Region

Resources are deployed to: **eu-central-1**