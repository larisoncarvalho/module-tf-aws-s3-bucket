#!/bin/sh
set -e

TF_BIN_PATH="$1"

[ -z "$TF_BIN_PATH" ] && {
  echo "Usage: $0 <tf-bin-path>" >&2
  exit 1
}

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.de_manuel_meireles_primary_workgroup.aws_athena_workgroup.this' 'de-manuel-meireles-primary-workgroup'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.platform_api_dev.aws_api_gateway_rest_api.this' 'co2oj9ra4j'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.sg_api_qa.aws_api_gateway_rest_api.this' 'ihtay07sw3'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.arunim_test_api.aws_api_gateway_rest_api.this' 'l3ds4c0jd3'