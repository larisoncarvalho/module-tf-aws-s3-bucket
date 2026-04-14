# stulyze-app-cloudformation

## Description

CloudFormation stack managing the Stulyze application DynamoDB table resource.

## Module Overview

| Module | Description |
|--------|-------------|
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_cloudformation_stack` | `this` | The stulyze-app CloudFormation stack |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region | `"ap-southeast-1"` |
| `name` | `string` | Stack name | `"stulyze-app"` |
| `disable_rollback` | `bool` | Set to true to disable rollback of the stack if stack creation failed | `false` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `stack_id` | A unique identifier of the stack |
| `stack_outputs` | A map of outputs from the stack |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

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