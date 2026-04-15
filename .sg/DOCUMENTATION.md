# API Gateway Infrastructure

## Overview

This Terraform stack manages API Gateway REST API infrastructure in AWS.

## Stack Details

- **Name**: api-gateway-infrastructure
- **Description**: API Gateway REST API infrastructure
- **Region**: eu-central-1

## Modules

### api_gateway_rest_api

Manages API Gateway REST API

**Resources:**
- `aws_api_gateway_rest_api.this`

**Variables:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| name | string | Name of the API Gateway REST API | Yes |
| api_key_source | string | Source of the API key for requests | Yes |

**Outputs:**

| Name | Description |
|------|-------------|
| api_id | API Gateway REST API ID |
| created_date | API Gateway REST API creation date |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |

## Root Outputs

| Name | Description |
|------|-------------|
| arunim_test_api_id | API Gateway REST API ID for arunim-test-api |

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

## Module Instances

### arunim_test_api

API Gateway REST API named "arunim-test-api" with API key source set to HEADER.

**Configuration:**
- Name: arunim-test-api
- API Key Source: HEADER