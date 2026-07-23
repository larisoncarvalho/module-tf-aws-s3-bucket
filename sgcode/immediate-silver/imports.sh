#!/bin/sh
set -e

TF_BIN_PATH="$1"

[ -z "$TF_BIN_PATH" ] && {
  echo "Usage: $0 <tf-bin-path>" >&2
  exit 1
}

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.vpc.aws_vpc.this' 'vpc-005ac2a269732d653'