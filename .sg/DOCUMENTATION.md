# internet-gateway-ap-southeast-1

## Description

AWS Internet Gateway attached to a VPC in ap-southeast-1.

## Module Overview

| Module | Description |
|--------|-------------|
| `internet_gateway` | Manages an AWS Internet Gateway and its VPC attachment |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `region` | `string` | AWS region |
| `vpc_id` | `string` | The VPC ID to attach the Internet Gateway to |

## Outputs Reference

| Name | Description |
|------|-------------|
| `internet_gateway_id` | The ID of the Internet Gateway |
| `internet_gateway_arn` | The ARN of the Internet Gateway |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
./imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```