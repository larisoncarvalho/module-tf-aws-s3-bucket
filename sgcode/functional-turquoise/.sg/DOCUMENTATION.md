# multi-service-infrastructure

Multi-service infrastructure including ACM certificates, API Gateway REST APIs, AppSync GraphQL API, and Athena workgroups

## Architecture

This stack manages the following AWS resources across multiple modules:

- **acm_certificate**: ACM certificates for domain validation
- **api_gateway_rest_api**: API Gateway REST APIs
- **appsync_graphql_api**: AppSync GraphQL API
- **athena_workgroup**: Athena workgroups

## Modules

### acm_certificate

Manages ACM certificates for domain validation

**Resources:**
- `aws_acm_certificate.this` (for_each)

### api_gateway_rest_api

Manages API Gateway REST APIs

**Resources:**
- `aws_api_gateway_rest_api.this` (for_each)

### appsync_graphql_api

Manages AppSync GraphQL API

**Resources:**
- `aws_appsync_graphql_api.this`

### athena_workgroup

Manages Athena workgroups

**Resources:**
- `aws_athena_workgroup.this` (for_each)

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |
| certificates | map(object) | ACM certificates to create | - |
| rest_apis | map(object) | API Gateway REST APIs to create | - |
| athena_workgroups | map(object) | Athena workgroups to create | - |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arns | ARNs of the ACM certificates |
| api_gateway_api_ids | IDs of the API Gateway REST APIs |
| appsync_api_id | ID of the AppSync GraphQL API |
| athena_workgroup_arns | ARNs of the Athena workgroups |

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

## Notes

- This stack imports existing AWS resources
- Run `terraform plan` after import to verify zero drift
- All resources are managed through Terraform variables in `environments/terraform.tfvars`