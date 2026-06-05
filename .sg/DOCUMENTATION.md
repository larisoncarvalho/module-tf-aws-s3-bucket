# stulyze-app-cloudformation

## Description

CloudFormation stack managing a DynamoDB table for Stulyze application resources.

## Architecture Overview

This stack provisions and manages an AWS CloudFormation stack (`stulyze-app`) that internally creates a DynamoDB table (`StulyzeResourceTable`) with a composite key schema (ParentId as HASH key, ResourceId as RANGE key) and provisioned throughput of 5 read/write capacity units.

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
| `region` | `string` | AWS region | `ap-southeast-1` |
| `name` | `string` | Stack name | `stulyze-app` |
| `template_body` | `string` | CloudFormation template body (JSON) | _(see tfvars)_ |
| `disable_rollback` | `bool` | Disable rollback on stack creation failure | `false` |
| `timeout_in_minutes` | `number` | Timeout before stack status becomes CREATE_FAILED | `0` |

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
# or with OpenTofu:
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