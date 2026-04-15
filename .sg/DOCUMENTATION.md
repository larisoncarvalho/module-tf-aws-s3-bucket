# multi-service-infrastructure

ACM certificates, API Gateway REST APIs, AppSync GraphQL API, and Athena workgroups

## Architecture

This stack manages multiple AWS services across four modules:

- **acm_certificate**: Manages ACM certificates for domain validation
- **api_gateway_rest_api**: Manages API Gateway REST APIs
- **appsync_graphql_api**: Manages AppSync GraphQL API
- **athena_workgroup**: Manages Athena workgroups

## Modules

### acm_certificate

Manages ACM certificates with DNS validation for multiple domains.

**Resources:**
- `aws_acm_certificate.this` (for_each)

**Outputs:**
- `certificate_arns`: ARNs of the ACM certificates
- `certificate_ids`: IDs of the ACM certificates

### api_gateway_rest_api

Manages API Gateway REST APIs with configurable settings for API key sources, binary media types, and compression.

**Resources:**
- `aws_api_gateway_rest_api.this` (for_each)

**Outputs:**
- `api_ids`: IDs of the API Gateway REST APIs
- `api_arns`: ARNs of the API Gateway REST APIs

### appsync_graphql_api

Manages a single AppSync GraphQL API with API key authentication.

**Resources:**
- `aws_appsync_graphql_api.this`

**Outputs:**
- `api_id`: ID of the AppSync GraphQL API
- `uris`: URIs of the AppSync GraphQL API

### athena_workgroup

Manages Athena workgroups with query result configurations, encryption, and CloudWatch metrics.

**Resources:**
- `aws_athena_workgroup.this` (for_each)

**Outputs:**
- `workgroup_ids`: IDs of the Athena workgroups
- `workgroup_arns`: ARNs of the Athena workgroups

## Variables

| Name | Type | Description |
|------|------|-------------|
| region | string | AWS region |
| certificates | map(object) | ACM certificates to create |
| rest_apis | map(object) | API Gateway REST APIs to create |
| workgroups | map(object) | Athena workgroups to create |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arns | ARNs of the ACM certificates |
| api_gateway_ids | IDs of the API Gateway REST APIs |
| appsync_api_id | ID of the AppSync GraphQL API |
| athena_workgroup_ids | IDs of the Athena workgroups |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Managed Resources

- 2 ACM certificates (*.int.qa.stackguardian.io, stackguardian.io)
- 4 API Gateway REST APIs (platform-api-dev, sg-api-qa, arunim-test-api, github-oidc-wrapper)
- 1 AppSync GraphQL API (orchestrator-platform-api)
- 3 Athena workgroups (de-manuel-meireles, dev-manuel-meireles, dev-pedro-chaves)