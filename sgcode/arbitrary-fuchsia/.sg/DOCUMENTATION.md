# acm-certificates-api-gateways-appsync-athena

ACM certificates, API Gateway REST APIs, AppSync GraphQL API, and Athena workgroups

## Module Overview

This stack manages the following AWS resources across four modules:

### acm_certificate
Manages ACM certificates for domain validation

### api_gateway_rest_api
Manages API Gateway REST APIs

### appsync_graphql_api
Manages AppSync GraphQL API

### athena_workgroup
Manages Athena workgroups

## Variables

| Name | Type | Description |
|------|------|-------------|
| region | string | AWS region |
| certificates | map(object) | ACM certificates to create |
| rest_apis | map(object) | API Gateway REST APIs to create |
| athena_workgroups | map(object) | Athena workgroups to create |

## Outputs

| Name | Description |
|------|-------------|
| certificate_arns | ARNs of the ACM certificates |
| api_gateway_ids | IDs of the API Gateway REST APIs |
| appsync_api_id | ID of the AppSync GraphQL API |
| athena_workgroup_ids | IDs of the Athena workgroups |

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

## Region

This stack is deployed in **eu-central-1**.