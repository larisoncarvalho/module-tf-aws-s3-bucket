# stulyze-app-cloudformation

## Description

CloudFormation stack for the Stulyze application, managing a DynamoDB table resource.

## Stack Overview

| Component | Description |
|-----------|-------------|
| Region | ap-southeast-1 |
| Module | `cloudformation_stack` — Manages the stulyze-app CloudFormation stack |

## Modules

### `cloudformation_stack`

Manages the `aws_cloudformation_stack` resource for the Stulyze application.

| Resource | Type | Description |
|----------|------|-------------|
| `aws_cloudformation_stack.this` | `aws_cloudformation_stack` | The stulyze-app CloudFormation stack |

## Variables

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `region` | `string` | `"ap-southeast-1"` | AWS region to deploy resources |
| `cloudformation_stack_name` | `string` | `"stulyze-app"` | The name of the CloudFormation stack |
| `cloudformation_stack_disable_rollback` | `bool` | `false` | Whether to disable rollback on stack creation failure |
| `cloudformation_stack_enable_termination_protection` | `bool` | `false` | Whether termination protection is enabled on the stack |

## Outputs

| Name | Description |
|------|-------------|
| `stack_id` | The ID of the CloudFormation stack |
| `stack_name` | The name of the CloudFormation stack |
| `stack_outputs` | The outputs of the CloudFormation stack |

## Usage

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

```sh
chmod +x imports.sh
./imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```