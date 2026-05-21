# athena-workgroup-primary

## Description

Manages an AWS Athena workgroup named `primary` in the `ap-southeast-1` region.

## Module Overview

| Module | Description |
|--------|-------------|
| `athena_workgroup` | Manages the primary Athena workgroup and its configuration |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_athena_workgroup` | `this` | The primary Athena workgroup |

## Variables Reference

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `region` | `string` | `"ap-southeast-1"` | AWS region where resources will be managed |
| `name` | `string` | `"primary"` | Name of the Athena workgroup |
| `state` | `string` | `"ENABLED"` | State of the workgroup. Valid values are `DISABLED` or `ENABLED` |
| `enforce_workgroup_configuration` | `bool` | `false` | Whether the settings for the workgroup override client-side settings |
| `publish_cloudwatch_metrics_enabled` | `bool` | `true` | Whether Amazon CloudWatch metrics are enabled for the workgroup |
| `requester_pays_enabled` | `bool` | `false` | Whether members can reference Amazon S3 Requester Pays buckets in queries |
| `selected_engine_version` | `string` | `"AUTO"` | Requested engine version for the workgroup |

## Outputs Reference

| Name | Description |
|------|-------------|
| `athena_workgroup_arn` | ARN of the primary Athena workgroup |
| `athena_workgroup_id` | ID (name) of the primary Athena workgroup |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

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