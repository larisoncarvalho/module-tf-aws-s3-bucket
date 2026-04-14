# arunim-test-api-stack

## Description
API Gateway REST API for arunim-test-api deployed in eu-central-1.

## Module Overview

| Module | Description |
|--------|-------------|
| `api_gateway_rest_api` | Manages the arunim-test-api API Gateway REST API |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region to deploy resources |

## Outputs Reference

| Name | Description |
|------|-------------|
| `api_id` | The ID of the API Gateway REST API |

## Usage Instructions

### 1. Initialize
```sh
terraform init
```

### 2. Import Existing Resources
```sh
chmod +x imports.sh
./imports.sh <tf-bin-path>
```

### 3. Plan
```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply
```sh
terraform apply -var-file environments/sg.tfvars
```