#!/bin/sh
set -e

[ -z "$1" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }
TF_BIN_PATH="$1"

"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.athena_workgroup.aws_athena_workgroup.this' 'non-prod-primary-workgroup'