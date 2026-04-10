# non-prod-athena-workgroup

## Description

Primary Athena workgroup for non-prod data lake with medallion architecture. This stack provisions and manages the primary AWS Athena workgroup used for querying data across the non-prod data lake environment.

## Architecture

The stack follows a medallion architecture pattern for the non-prod data lake. Query results are stored in a dedicated S3 bucket with SSE_S3 encryption. CloudWatch metrics are published for observability, and workgroup configuration is enforced to ensure consistent query behaviour across all users.

## Module Overview

| Module | Source | Description |
|--------|--------|-------------|
| `athena_workgroup` | `./modules/athena_workgroup` | Manages the primary Athena workgroup for the non-prod environment |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_athena_workgroup` | `this` | Primary Athena workgroup for non-prod |

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region to deploy resources | — |

### Module Variables (`athena_workgroup`)

| Name | Type | Description |
|------|------|-------------|
| `name` | `string` | Name of the Athena workgroup |
| `description` | `string` | Description of the Athena workgroup |
| `state` | `string` | State of the workgroup (ENABLED or DISABLED) |
| `bytes_scanned_cutoff_per_query` | `number` | Maximum bytes scanned per query before cancellation |
| `enforce_workgroup_configuration` | `bool` | Whether to enforce workgroup configuration over client-side settings |
| `publish_cloudwatch_metrics_enabled` | `bool` | Whether to publish CloudWatch metrics for the workgroup |
| `requester_pays_enabled` | `bool` | Whether requester pays for cross-account data access |
| `selected_engine_version` | `string` | Athena engine version selected for the workgroup |
| `output_location` | `string` | S3 URI for query result output location |
| `encryption_option` | `string` | Encryption option for query results (e.g. SSE_S3, SSE_KMS, CSE_KMS) |
| `tags` | `map(string)` | Tags to apply to the Athena workgroup |

## Outputs

| Name | Description |
|------|-------------|
| `workgroup_id` | ID of the Athena workgroup |
| `workgroup_arn` | ARN of the Athena workgroup |

## Configuration

### Workgroup Settings

| Setting | Value |
|---------|-------|
| Engine Version | AUTO |
| Bytes Scanned Cutoff | 1 GiB (1073741824 bytes) |
| Enforce Configuration | true |
| CloudWatch Metrics | Enabled |
| Requester Pays | Disabled |
| Output Location | `s3://non-prod-infra-athena-results/query-results/` |
| Encryption | SSE_S3 |

### Tags

| Key | Value |
|-----|-------|
| Architecture | medallion |
| CostCenter | non-prod-data-lake |
| DataRetention | short-term |
| Environment | non-prod |
| ManagedBy | terraform |
| Project | data-lake |

## Usage

### Prerequisites

- AWS credentials configured with permissions to manage Athena workgroups
- The S3 bucket `non-prod-infra-athena-results` must exist prior to apply
- Terraform or OpenTofu installed

### Steps

```sh
# 1. Initialise the working directory
terraform init

# 2. Import existing resources
chmod +x imports.sh
./imports.sh terraform

# 3. Review the plan (expect zero drift after import)
terraform plan -var-file environments/sg.tfvars

# 4. Apply if needed
terraform apply -var-file environments/sg.tfvars
```