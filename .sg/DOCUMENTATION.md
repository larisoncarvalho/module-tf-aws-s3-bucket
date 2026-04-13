# stulyze-app-cloudformation

## Description

CloudFormation stack for the stulyze-app application managing a DynamoDB table resource.

## Stack Overview

| Component | Details |
|-----------|---------|
| Stack Name | stulyze-app-cloudformation |
| Region | ap-southeast-1 |
| Provider | AWS (hashicorp/aws) |

## Modules

### `cloudformation_stack`

Manages the stulyze-app CloudFormation stack.

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_cloudformation_stack` | `this` | The CloudFormation stack resource |

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region | `"ap-southeast-1"` |
| `name` | `string` | CloudFormation stack name | `"stulyze-app"` |
| `disable_rollback` | `bool` | Set to true to disable rollback of the stack if stack creation failed | `false` |

## Outputs

| Name | Description |
|------|-------------|
| `stack_id` | A unique identifier of the CloudFormation stack |
| `stack_outputs` | A map of outputs from the CloudFormation stack |

## Usage

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