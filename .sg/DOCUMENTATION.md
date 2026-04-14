# stulyze-app-cloudformation

## Description

CloudFormation stack for the Stulyze application managing a DynamoDB table resource.

## Stack Overview

| Module | Description |
|--------|-------------|
| `cloudformation_stack` | Manages the stulyze-app CloudFormation stack |

## Module Details

### cloudformation_stack (`modules/cloudformation_stack`)

Manages an `aws_cloudformation_stack` resource for the Stulyze application.

**Resources:**
| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_cloudformation_stack` | `this` | The Stulyze app CloudFormation stack |

## Variables Reference

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `region` | `string` | — | AWS region |
| `stulyze_app_name` | `string` | — | CloudFormation stack name for the Stulyze application |
| `stulyze_app_disable_rollback` | `bool` | — | Set to true to disable rollback of the stack if stack creation failed |

## Outputs Reference

| Output | Description |
|--------|-------------|
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

## Notes

- This stack targets the `ap-southeast-1` (Singapore) AWS region.
- The CloudFormation stack `stulyze-app` is imported via `imports.sh` — no new stack is created.
- `disable_rollback` is set to `false` by default, meaning CloudFormation will roll back on failure.