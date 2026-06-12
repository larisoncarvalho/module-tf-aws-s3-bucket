# stulyze-app-infrastructure

## Description

Manages the stulyze-app CloudFormation stack and its associated internet gateway.

## Stack Overview

| Module | Description |
|--------|-------------|
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack |
| `internet_gateway` | Manages the internet gateway attached to the VPC |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region | `"ap-southeast-1"` |
| `cloudformation_stack_name` | `string` | The name of the CloudFormation stack | `"stulyze-app"` |
| `cloudformation_stack_disable_rollback` | `bool` | Set to true to disable rollback of the stack if stack creation failed | `false` |
| `internet_gateway_vpc_id` | `string` | The VPC ID to attach the internet gateway to | `"vpc-05fed6e9ac0f64a6e"` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `cloudformation_stack_id` | The unique identifier of the CloudFormation stack |
| `cloudformation_stack_name` | The name of the CloudFormation stack |
| `internet_gateway_id` | The ID of the Internet Gateway |
| `internet_gateway_arn` | The ARN of the Internet Gateway |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

```sh
chmod +x imports.sh
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