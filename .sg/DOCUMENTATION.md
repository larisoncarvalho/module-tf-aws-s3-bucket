# stulyze-app-cloudformation

## Description

CloudFormation stack managing the Stulyze application DynamoDB table resource.

## Module Overview

| Module | Description |
|--------|-------------|
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack |

## Resources

| Resource Type | Name | Description |
|---------------|------|-------------|
| `aws_cloudformation_stack` | `this` | The stulyze-app CloudFormation stack |

## Variables Reference

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `region` | `string` | `"ap-southeast-1"` | AWS region where resources will be managed |
| `name` | `string` | `"stulyze-app"` | CloudFormation stack name |
| `disable_rollback` | `bool` | `false` | Whether to disable rollback of the stack if stack creation failed |

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