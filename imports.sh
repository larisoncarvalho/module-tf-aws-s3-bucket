#!/bin/sh
set -e

[ -z "$1" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }
TF_BIN_PATH="$1"

"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.api_gateway_rest_api.aws_api_gateway_rest_api.this' 'l3ds4c0jd3'