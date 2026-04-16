# athena-workgroup-primary

## Description

Manages an AWS Athena workgroup named `primary` in `ap-southeast-1`.

## Stack Overview

This stack provisions and manages a single Athena workgroup with its associated configuration, including engine version selection, CloudWatch metrics publishing, and workgroup-level settings enforcement.

## Module Overview

| Module | Description |
|--------|-------------|
| `athena_workgroup` | Manages the primary Athena workgroup and its configuration |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_athena_workgroup` | `this` | The primary Athena workgroup |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | `string` | AWS region where resources will be managed | — |
| `athena_workgroup_name` | `string` | Name of the Athena workgroup | — |
| `athena_workgroup_state` | `string` | State of the workgroup (`DISABLED` or `ENABLED`) | — |
| `athena_workgroup_enforce_workgroup_configuration` | `bool` | Whether workgroup settings override client-side settings | — |
| `athena_workgroup_publish_cloudwatch_metrics_enabled` | `bool` | Whether CloudWatch metrics are enabled for the workgroup | — |
| `athena_workgroup_requester_pays_enabled` | `bool` | Whether members can reference S3 Requester Pays buckets | — |
| `athena_workgroup_selected_engine_version` | `string` | Requested Athena engine version | — |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `athena_workgroup_arn` | ARN of the Athena workgroup |
| `athena_workgroup_id` | ID (name) of the Athena workgroup |

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