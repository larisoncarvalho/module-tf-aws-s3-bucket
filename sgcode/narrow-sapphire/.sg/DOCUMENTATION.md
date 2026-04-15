# athena-workgroup-primary

## Description

Manages an AWS Athena workgroup named `primary` in `ap-southeast-1`.

## Module Overview

| Module | Description |
|--------|-------------|
| `athena_workgroup` | Manages the primary Athena workgroup and its configuration |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region where resources will be managed | `"ap-southeast-1"` |
| `name` | `string` | Name of the Athena workgroup | `"primary"` |
| `state` | `string` | State of the workgroup. Valid values are `DISABLED` or `ENABLED` | `"ENABLED"` |
| `enforce_workgroup_configuration` | `bool` | Whether the settings for the workgroup override client-side settings | `false` |
| `publish_cloudwatch_metrics_enabled` | `bool` | Whether Amazon CloudWatch metrics are enabled for the workgroup | `true` |
| `requester_pays_enabled` | `bool` | Whether members can reference Amazon S3 Requester Pays buckets in queries | `false` |
| `selected_engine_version` | `string` | Requested Athena engine version | `"AUTO"` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `athena_workgroup_arn` | ARN of the Athena workgroup |
| `athena_workgroup_id` | ID (name) of the Athena workgroup |

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