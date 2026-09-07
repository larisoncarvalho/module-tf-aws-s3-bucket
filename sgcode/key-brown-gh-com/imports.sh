#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.cloudwatch_log_group.aws_cloudwatch_log_group.this' '/aws-glue/crawlers'