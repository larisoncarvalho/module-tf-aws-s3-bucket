# stulyze-app-cloudformation

## Description

CloudFormation stack managing the Stulyze application infrastructure including a DynamoDB table for resource storage.

## Stack Overview

| Component | Details |
|-----------|---------|
| Region | ap-southeast-1 |
| Provider | AWS (hashicorp/aws) |

## Modules

### `cloudformation_stack` (`./modules/cloudformation_stack`)

Manages the stulyze-app CloudFormation stack.

| Resource | Type | Description |
|----------|------|-------------|
| `aws_cloudformation_stack.this` | `aws_cloudformation_stack` | The stulyze-app CloudFormation stack |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region | — |
| `cloudformation_stack_name` | `string` | CloudFormation stack name | — |
| `cloudformation_stack_disable_rollback` | `bool` | Set to true to disable rollback of the stack if stack creation failed | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| `stack_id` | A unique identifier of the CloudFormation stack |
| `stack_outputs` | A map of outputs from the CloudFormation stack |

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