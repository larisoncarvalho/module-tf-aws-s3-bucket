# sg-api-qa-rest-api

## Description

API Gateway REST API for sg-api-qa environment.

## Module Overview

| Module | Description |
|--------|-------------|
| `api_gateway_rest_api` | Manages the sg-api-qa API Gateway REST API |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_api_gateway_rest_api` | `this` | The REST API resource |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region where resources will be managed | — |
| `name` | `string` | Name of the REST API | — |
| `api_key_source` | `string` | Source of the API key for requests (HEADER or AUTHORIZER) | — |
| `binary_media_types` | `list(string)` | List of binary media types supported by the REST API | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| `rest_api_id` | ID of the REST API |
| `rest_api_arn` | ARN of the REST API |
| `execution_arn` | Execution ARN of the REST API |
| `root_resource_id` | Resource ID of the REST API root |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

```sh
./imports.sh terraform
# or for OpenTofu:
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```