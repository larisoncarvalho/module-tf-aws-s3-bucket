# platform-api-dev-test-1-cloudformation

## Description

CloudFormation stack for platform-api-dev-test-1, automatically generated with Zappa for API Gateway resources.

## Module Overview

| Module | Description |
|--------|-------------|
| `cloudformation_stack` | Manages the platform-api-dev-test-1 CloudFormation stack containing API Gateway resources |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_cloudformation_stack` | `this` | The CloudFormation stack for platform-api-dev-test-1 |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region | `"eu-central-1"` |
| `name` | `string` | Stack name | `"platform-api-dev-test-1"` |
| `disable_rollback` | `bool` | Set to true to disable rollback of the stack if stack creation failed | `false` |
| `tags` | `map(string)` | Map of resource tags to associate with this stack | `{ ZappaProject = "platform-api-dev-test-1" }` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `stack_id` | A unique identifier of the CloudFormation stack |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

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