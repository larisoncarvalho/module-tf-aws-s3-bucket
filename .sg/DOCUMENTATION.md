# ACM, API Gateway, AppSync, and Athena Infrastructure

## Overview

This Terraform stack manages multi-service infrastructure in AWS eu-central-1, including:

- **ACM Certificates**: Domain validation certificates for StackGuardian domains
- **API Gateway REST APIs**: Multiple REST APIs for platform services
- **AppSync GraphQL API**: Orchestrator platform API with API key authentication
- **Athena Workgroups**: Query workgroups with S3 result storage and encryption

## Architecture

The stack is organized into four independent modules:

1. **acm_certificate**: Manages ACM certificates with DNS validation
2. **api_gateway_rest_api**: Manages API Gateway REST APIs with configurable settings
3. **appsync_graphql_api**: Manages a single AppSync GraphQL API
4. **athena_workgroup**: Manages Athena workgroups with query result configuration

## Modules

### acm_certificate

Manages ACM certificates for domain validation.

**Resources:**
- `aws_acm_certificate` (for_each over certificates map)

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| certificates | map(object) | ACM certificates to create with domain validation configuration |

**Outputs:**
| Output | Description |
|--------|-------------|
| certificate_arns | ARNs of the ACM certificates |
| certificate_ids | IDs of the ACM certificates |

### api_gateway_rest_api

Manages API Gateway REST APIs.

**Resources:**
- `aws_api_gateway_rest_api` (for_each over rest_apis map)

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| rest_apis | map(object) | API Gateway REST APIs to create |

**Outputs:**
| Output | Description |
|--------|-------------|
| api_ids | IDs of the API Gateway REST APIs |
| api_arns | ARNs of the API Gateway REST APIs |

### appsync_graphql_api

Manages AppSync GraphQL API.

**Resources:**
- `aws_appsync_graphql_api` (single instance)

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| name | string | Name of the AppSync GraphQL API |
| authentication_type | string | Authentication type for the API |
| xray_enabled | bool | Whether X-Ray tracing is enabled |
| introspection_config | string | Introspection configuration |
| query_depth_limit | number | Maximum query depth limit |
| resolver_count_limit | number | Maximum resolver count limit |

**Outputs:**
| Output | Description |
|--------|-------------|
| api_id | ID of the AppSync GraphQL API |
| api_arn | ARN of the AppSync GraphQL API |
| uris | URIs of the AppSync GraphQL API |

### athena_workgroup

Manages Athena workgroups with query result configuration.

**Resources:**
- `aws_athena_workgroup` (for_each over workgroups map)

**Inputs:**
| Variable | Type | Description |
|----------|------|-------------|
| workgroups | map(object) | Athena workgroups to create with result configuration |

**Outputs:**
| Output | Description |
|--------|-------------|
| workgroup_ids | IDs of the Athena workgroups |
| workgroup_arns | ARNs of the Athena workgroups |

## Root Variables

| Variable | Type | Description |
|----------|------|-------------|
| region | string | AWS region for the infrastructure |
| certificates | map(object) | ACM certificates to create |
| rest_apis | map(object) | API Gateway REST APIs to create |
| athena_workgroups | map(object) | Athena workgroups to create |

## Root Outputs

| Output | Description |
|--------|-------------|
| certificate_arns | ARNs of the ACM certificates |
| api_gateway_ids | IDs of the API Gateway REST APIs |
| appsync_api_id | ID of the AppSync GraphQL API |
| athena_workgroup_arns | ARNs of the Athena workgroups |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

Before applying changes, import all existing resources:

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

Review the execution plan to ensure zero drift:

```bash
terraform plan -var-file=environments/terraform.tfvars
```

Expected output: **No changes. Your infrastructure matches the configuration.**

### Apply Configuration

If changes are needed:

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Resource Inventory

### ACM Certificates (2)
- `*.int.qa.stackguardian.io` with SANs
- `stackguardian.io` with wildcard SANs

### API Gateway REST APIs (4)
- `platform-api-dev` (Zappa-managed)
- `sg-api-qa`
- `arunim-test-api`
- `github-oidc-wrapper`

### AppSync GraphQL API (1)
- `orchestrator-platform-api` (API_KEY authentication)

### Athena Workgroups (3)
- `de-manuel-meireles-primary-workgroup` (10GB scan limit)
- `dev-manuel-meireles-primary-workgroup` (100MB scan limit)
- `dev-pedro-chaves-primary-workgroup` (100MB scan limit)

## Notes

- All resources are imported from existing AWS infrastructure
- The goal is zero drift after import
- Athena workgroups use SSE-S3 encryption for query results
- API Gateway APIs use HEADER as the API key source
- AppSync API has introspection enabled with no depth/resolver limits