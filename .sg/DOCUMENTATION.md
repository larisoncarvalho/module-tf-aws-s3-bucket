# Athena Workgroup Infrastructure

## Overview

This Terraform stack manages an AWS Athena workgroup configuration for query execution in the non-production environment. The workgroup is configured with query result storage, encryption, CloudWatch metrics publishing, and query cost controls.

## Stack Description

- **Name**: athena-workgroup-infrastructure
- **Description**: Athena workgroup configuration for query execution
- **Region**: eu-central-1

## Module Overview

### athena_workgroup

Manages Athena workgroup with query result configuration.

**Resources:**
- `aws_athena_workgroup.this` - Athena workgroup with configuration for query execution, result storage, and monitoring

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
| selected_engine_version | string | Athena engine version to use |

## Outputs

| Name | Description | Source |
|------|-------------|--------|
| workgroup_id | ID of the Athena workgroup | module.non_prod_primary_workgroup.workgroup_id |
| workgroup_arn | ARN of the Athena workgroup | module.non_prod_primary_workgroup.workgroup_arn |

## Usage

### Prerequisites

- AWS credentials configured
- Terraform or OpenTofu installed
- S3 bucket `non-prod-infra-athena-results` must exist for query results

### Deployment Steps

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh terraform
   ```

3. **Review Changes:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Configuration Details

The stack deploys a single Athena workgroup (`non-prod-primary-workgroup`) with the following configuration:

- **Query Cost Control**: 1GB bytes scanned cutoff per query
- **Result Storage**: S3 bucket with SSE-S3 encryption
- **Monitoring**: CloudWatch metrics enabled
- **Engine**: AUTO version selection
- **Configuration Enforcement**: Enabled to ensure consistent query execution settings

## Notes

- This stack imports an existing Athena workgroup resource
- The workgroup configuration is enforced for all queries executed within it
- Query results are stored in the specified S3 location with server-side encryption
- CloudWatch metrics are published for monitoring query performance and costs