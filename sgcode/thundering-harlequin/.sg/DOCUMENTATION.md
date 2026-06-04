# athena-workgroup-iam-role

## Description

Manages an Athena workgroup and an IAM role for SageMaker Service Catalog API Gateway products.

## Stack Overview

| Module | Description |
|--------|-------------|
| `athena_workgroup` | Manages the primary Athena workgroup |
| `iam_role` | Manages the IAM role for SageMaker Service Catalog API Gateway products |

## Module Details

### athena_workgroup

Provisions an `aws_athena_workgroup` resource with configurable engine version, CloudWatch metrics, and workgroup enforcement settings.

### iam_role

Provisions an `aws_iam_role` resource for use by Amazon API Gateway within the SageMaker Service Catalog portfolio.

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | string | AWS region where resources will be managed |
| `athena_workgroup_name` | string | Name of the Athena workgroup |
| `athena_workgroup_state` | string | State of the Athena workgroup (ENABLED or DISABLED) |
| `athena_workgroup_enforce_workgroup_configuration` | bool | Whether workgroup settings override client-side settings |
| `athena_workgroup_publish_cloudwatch_metrics_enabled` | bool | Whether Amazon CloudWatch metrics are enabled for the workgroup |
| `athena_workgroup_requester_pays_enabled` | bool | Whether members can reference Amazon S3 Requester Pays buckets in queries |
| `athena_workgroup_selected_engine_version` | string | Requested Athena engine version |
| `iam_role_name` | string | Friendly name of the IAM role |
| `iam_role_path` | string | Path to the IAM role |
| `iam_role_description` | string | Description of the IAM role |
| `iam_role_assume_role_policy` | string | Policy document granting permission to assume the role (JSON string) |
| `iam_role_max_session_duration` | number | Maximum session duration in seconds |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `athena_workgroup_arn` | ARN of the Athena workgroup |
| `athena_workgroup_id` | ID of the Athena workgroup |
| `iam_role_arn` | ARN of the IAM role |
| `iam_role_id` | ID of the IAM role |
| `iam_role_name` | Name of the IAM role |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

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