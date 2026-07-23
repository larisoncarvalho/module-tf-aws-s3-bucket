#!/bin/sh
set -e

TF_BIN_PATH="$1"

[ -z "$TF_BIN_PATH" ] && {
  echo "Usage: $0 <tf-bin-path>" >&2
  exit 1
}

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.api_gateway.aws_api_gateway_rest_api.this' 'ihtay07sw3'