#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.acm_certificates.aws_acm_certificate.this["int_qa_stackguardian_io"]' 'arn:aws:acm:eu-central-1:790543352839:certificate/8f5ac570-f5eb-4346-b4f7-a7934c206bb5'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.acm_certificates.aws_acm_certificate.this["stackguardian_io"]' 'arn:aws:acm:eu-central-1:790543352839:certificate/c12e4f53-dd2a-4597-994d-2752c994a4e9'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.platform_api_dev.aws_api_gateway_rest_api.this' 'co2oj9ra4j'