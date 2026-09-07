# aws-glue-crawlers-log-group

## Description

CloudWatch Log Group for AWS Glue crawlers logging. This stack manages the `/aws-glue/crawlers` CloudWatch Log Group used by AWS Glue crawler jobs to write log output.

## Module Overview

| Module | Path | Description |
|--------|------|-------------|
| `cloudwatch_log_group` | `modules/cloudwatch_log_group` | Manages the /aws-glue/crawlers CloudWatch Log Group |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `aws_cloudwatch_log_group` | `this` | The /aws-glue/crawlers CloudWatch Log Group |

## Variables Reference

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `region` | `string` | `"eu-central-1"` | AWS region where resources are managed |
| `log_group_name` | `string` | `"/aws-glue/crawlers"` | The name of the CloudWatch Log Group |
| `log_group_class` | `string` | `"STANDARD"` | The log class of the log group |
| `retention_in_days` | `number` | `0` | Number of days to retain log events; 0 means never expire |
| `deletion_protection_enabled` | `bool` | `false` | Whether deletion protection is enabled on the log group |
| `skip_destroy` | `bool` | `false` | If true, the log group will not be deleted on destroy |

## Outputs Reference

| Name | Description |
|------|-------------|
| `log_group_arn` | ARN of the CloudWatch Log Group |
| `log_group_name` | Name of the CloudWatch Log Group |

## Usage Instructions

### 1. Initialize

```sh
tofu init
```

### 2. Import Existing Resources

```sh
./imports.sh tofu
```

### 3. Plan

```sh
tofu plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
tofu apply -var-file environments/sg.tfvars
```