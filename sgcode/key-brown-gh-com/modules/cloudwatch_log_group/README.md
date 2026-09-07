# Module: cloudwatch_log_group

Manages a single AWS CloudWatch Log Group and its configuration.

## Variables

| Name | Type | Description |
|------|------|-------------|
| `name` | `string` | Name of the log group |
| `region` | `string` | AWS region |
| `log_group_class` | `string` | Log class (`STANDARD` or `INFREQUENT_ACCESS`) |
| `retention_in_days` | `number` | Retention in days; `0` = never expire |
| `deletion_protection_enabled` | `bool` | Enable deletion protection |
| `skip_destroy` | `bool` | Retain log group on `destroy` |

## Outputs

| Name | Description |
|------|-------------|
| `arn` | ARN of the log group |
| `name` | Name of the log group |
