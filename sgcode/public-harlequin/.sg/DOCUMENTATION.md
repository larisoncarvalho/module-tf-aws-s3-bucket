# Athena Workgroup Infrastructure

## Overview

This stack manages Athena workgroup configuration for data lake query execution in the eu-central-1 region.

## Modules

### athena_workgroup

Manages Athena workgroup with query result location and resource limits.

**Resources:**
- `aws_athena_workgroup.this` - Athena workgroup with configuration for query execution

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
| requester_pays_enabled | bool | Whether requester pays is enabled |
| output_location | string | S3 location for query results |
| encryption_option | string | Encryption option for query results |
| selected_engine_version | string | Athena engine version selection |
| tags | map(string) | Resource tags |

## Outputs

| Name | Description |
|------|-------------|
| workgroup_id | ID of the Athena workgroup |
| workgroup_arn | ARN of the Athena workgroup |
| workgroup_name | Name of the Athena workgroup |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Configuration Details

The stack creates a primary Athena workgroup with the following configuration:

- **Workgroup Name:** de-manuel-meireles-primary-workgroup
- **State:** ENABLED
- **Query Result Location:** s3://de-manuel-meireles-infra-athena-results/query-results/
- **Encryption:** SSE_S3
- **Bytes Scanned Cutoff:** 10 GB per query
- **CloudWatch Metrics:** Enabled
- **Engine Version:** AUTO
- **Tags:** Architecture (medallion), Environment (de-manuel-meireles), ManagedBy (terraform), Project (data-lake)

## Notes

- The workgroup enforces configuration settings to ensure consistent query execution
- Query results are encrypted using S3-managed encryption (SSE_S3)
- CloudWatch metrics publishing is enabled for monitoring
- The workgroup uses automatic engine version selection