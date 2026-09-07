# aws-glue-crawlers-log-group

Manages the `/aws-glue/crawlers` CloudWatch Log Group used by AWS Glue crawler jobs.

## Modules

| Module | Path |
|--------|------|
| `cloudwatch_log_group` | `modules/cloudwatch_log_group/` |

## Quick start

```sh
tofu init
./imports.sh tofu          # import existing resources
tofu plan  -var-file environments/sg.tfvars
tofu apply -var-file environments/sg.tfvars
```

## Configuration

Edit `environments/sg.tfvars` to change log group settings (name, retention, log class, etc.).
See `modules/cloudwatch_log_group/README.md` for the full variable reference.
