# stulyze-app-cloudformation

## Description

CloudFormation stack managing the stulyze-app infrastructure including a DynamoDB table for Stulyze resources.

## Stack Overview

| Component | Description |
|-----------|-------------|
| Region | ap-southeast-1 |
| Module | `cloudformation_stack` — Manages the stulyze-app CloudFormation stack |

## Module Reference

### `cloudformation_stack`

**Source:** `./modules/cloudformation_stack`

Manages an `aws_cloudformation_stack` resource representing the stulyze-app stack.

#### Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_cloudformation_stack` | `this` | The CloudFormation stack |

#### Inputs

| Variable | Type | Description |
|----------|------|-------------|
| `name` | `string` | Stack name |
| `disable_rollback` | `bool` | Set to true to disable rollback of the stack if stack creation failed |

#### Outputs

| Output | Description |
|--------|-------------|
| `stack_id` | A unique identifier of the stack |
| `stack_outputs` | A map of outputs from the stack |

## Root Variables

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `region` | `string` | `"ap-southeast-1"` | AWS region |
| `name` | `string` | `"stulyze-app"` | Stack name |
| `disable_rollback` | `bool` | `false` | Set to true to disable rollback of the stack if stack creation failed |

## Root Outputs

| Output | Description |
|--------|-------------|
| `stack_id` | A unique identifier of the stack |
| `stack_outputs` | A map of outputs from the stack |

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