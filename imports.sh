#!/bin/sh
set -e

TF_BIN_PATH="$1"

[ -z "$TF_BIN_PATH" ] && {
  echo "Usage: $0 <tf-bin-path>" >&2
  exit 1
}

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.platform_api_dev.aws_api_gateway_rest_api.this' 'co2oj9ra4j'