# Athena Workgroup Infrastructure

## Overview

This stack manages an Athena workgroup configuration for query execution in the `eu-central-1` region. It provides a configured workgroup with query result storage, encryption, and CloudWatch metrics publishing.

## Module Structure

### athena_workgroup

Manages an AWS Athena workgroup with comprehensive query execution configuration including:
- Query result output location and encryption
- Bytes scanned cutoff limits
- CloudWatch metrics publishing
- Workgroup configuration enforcement
- Engine version selection

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | eu-central-1 |

### Module Variables (athena_workgroup)

| Name | Type | Description |
|------|------|-------------|
| workgroup_name | string | Name of the Athena workgroup |
| description | string | Description of the workgroup purpose |
| state | string | State of the workgroup (ENABLED or DISABLED) |
| bytes_scanned_cutoff_per_query | number | Maximum bytes scanned per query before cutoff |
| enforce_workgroup_configuration | bool | Whether to enforce workgroup configuration settings |
| publish_cloudwatch_metrics_enabled | bool | Whether to publish CloudWatch metrics |
| requester_pays_enabled | bool | Whether requester pays for S3 data access |
| output_location | string | S3 location for query results |
| encryption_option | string | Encryption option for query results |
| selected_engine_version | string | Athena engine version selection |

## Outputs

| Name | Description |
|------|-------------|
| primary_workgroup_id | ID of the primary Athena workgroup |
| primary_workgroup_arn | ARN of the primary Athena workgroup |

## Usage

### Initialize

```bash
tofu init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh tofu
```

### Plan

```bash
tofu plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
tofu apply -var-file=environments/terraform.tfvars
```

## Resources Managed

- **Primary Workgroup**: `dev-manuel-meireles-primary-workgroup`
  - Query results stored in: `s3://dev-manuel-meireles-infra-athena-results/query-results/`
  - Encryption: SSE_S3
  - Engine version: AUTO
  - Bytes scanned cutoff: 107374182 (100 MB)
  - CloudWatch metrics: Enabled
  - Configuration enforcement: Enabled

## Notes

- The workgroup uses SSE_S3 encryption for query results
- CloudWatch metrics publishing is enabled for monitoring
- Workgroup configuration is enforced for all queries
- Query results are stored in a dedicated S3 bucket