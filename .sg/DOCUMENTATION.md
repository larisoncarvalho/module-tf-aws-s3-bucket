# stulyze-app-cloudformation

## Description

CloudFormation stack managing the stulyze-app infrastructure including a DynamoDB table for Stulyze resources.

## Stack Overview

| Component | Description |
|-----------|-------------|
| Region | ap-southeast-1 |
| Module | `cloudformation_stack` — Manages the stulyze-app CloudFormation stack |

## Module Overview

### `cloudformation_stack`

Manages the `aws_cloudformation_stack` resource for the stulyze-app stack.

| Resource | Type | Description |
|----------|------|-------------|
| `aws_cloudformation_stack.this` | `aws_cloudformation_stack` | The CloudFormation stack |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region | `"ap-southeast-1"` |
| `name` | `string` | Stack name | `"stulyze-app"` |
| `disable_rollback` | `bool` | Set to true to disable rollback of the stack if stack creation failed | `false` |

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