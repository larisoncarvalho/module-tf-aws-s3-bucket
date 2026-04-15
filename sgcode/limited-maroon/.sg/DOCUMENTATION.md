# stulyze-app-cloudformation

## Description

CloudFormation stack for the Stulyze application managing a DynamoDB table resource.

## Stack Overview

| Module | Description |
|--------|-------------|
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack |

## Module Details

### cloudformation_stack (`modules/cloudformation_stack`)

Manages the `aws_cloudformation_stack` resource for the Stulyze application.

**Resources:**
- `aws_cloudformation_stack.this` — The CloudFormation stack

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region | `"ap-southeast-1"` |
| `name` | `string` | CloudFormation stack name | `"stulyze-app"` |
| `disable_rollback` | `bool` | Set to true to disable rollback of the stack if stack creation failed | `false` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `stack_id` | The unique identifier of the CloudFormation stack |
| `stack_outputs` | A map of outputs from the CloudFormation stack |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
./imports.sh terraform
```

Or with OpenTofu:

```sh
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