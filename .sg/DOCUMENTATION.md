# Multi-Service Infrastructure

## Overview

This Terraform stack manages multi-service infrastructure in AWS, including ACM certificates for domain validation, API Gateway REST APIs, an AppSync GraphQL API, and Athena workgroups for query execution.

**Region:** eu-central-1

## Modules

### acm_certificate

Manages ACM certificates for domain validation.

**Resources:**
- `aws_acm_certificate.this` - ACM certificate with domain validation

**Key Features:**
- Configurable domain name and subject alternative names
- DNS or email validation methods
- Customizable key algorithms
- Resource tagging support

### api_gateway_rest_api

Manages API Gateway REST APIs.

**Resources:**
- `aws_api_gateway_rest_api.this` - REST API gateway

**Key Features:**
- Configurable API key sources
- Binary media type support
- Compression settings
- Resource tagging support

### appsync_graphql_api

Manages AppSync GraphQL API.

**Resources:**
- `aws_appsync_graphql_api.this` - GraphQL API

**Key Features:**
- Multiple authentication types
- X-Ray tracing support
- GraphQL endpoint management

### athena_workgroup

Manages Athena workgroups for query execution.

**Resources:**
- `aws_athena_workgroup.this` - Athena workgroup

**Key Features:**
- Query result encryption
- CloudWatch metrics publishing
- Configurable query limits
- S3 output location management
- Engine version selection

## Stack Components

### ACM Certificates

- **int_qa_stackguardian_cert**: Certificate for `*.int.qa.stackguardian.io`
- **stackguardian_cert**: Certificate for `stackguardian.io` and subdomains

### API Gateway REST APIs

- **platform_api_dev**: Development platform API (Zappa-managed)
- **sg_api_qa**: QA environment API
- **arunim_test_api**: Test API
- **github_oidc_wrapper**: GitHub OIDC wrapper API

### AppSync GraphQL API

- **orchestrator_platform_api**: Platform orchestrator GraphQL API with API key authentication

### Athena Workgroups

- **de_manuel_meireles_workgroup**: Production data lake workgroup (10GB query limit)
- **dev_manuel_meireles_workgroup**: Development workgroup (100MB query limit)
- **dev_pedro_chaves_workgroup**: Development workgroup (100MB query limit)

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resources | eu-central-1 |

## Outputs

| Name | Description |
|------|-------------|
| int_qa_cert_arn | ARN of the int.qa.stackguardian.io certificate |
| stackguardian_cert_arn | ARN of the stackguardian.io certificate |
| platform_api_dev_id | ID of the platform-api-dev REST API |
| sg_api_qa_id | ID of the sg-api-qa REST API |
| arunim_test_api_id | ID of the arunim-test-api REST API |
| github_oidc_wrapper_id | ID of the github-oidc-wrapper REST API |
| orchestrator_platform_api_id | ID of the orchestrator-platform-api GraphQL API |
| de_manuel_meireles_workgroup_id | ID of the de-manuel-meireles Athena workgroup |
| dev_manuel_meireles_workgroup_id | ID of the dev-manuel-meireles Athena workgroup |
| dev_pedro_chaves_workgroup_id | ID of the dev-pedro-chaves Athena workgroup |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

This stack manages existing AWS resources. Import them before making any changes:

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

- All resources are imported from existing AWS infrastructure
- ACM certificates use DNS validation
- Athena workgroups have different query limits based on environment (production vs development)
- API Gateway REST APIs support various binary media types and compression settings
- The GraphQL API uses API key authentication without X-Ray tracing
- All Athena workgroups use SSE-S3 encryption for query results