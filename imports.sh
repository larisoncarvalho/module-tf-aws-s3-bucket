#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.acm_certificate.aws_acm_certificate.this' 'arn:aws:acm:eu-central-1:790543352839:certificate/8f5ac570-f5eb-4346-b4f7-a7934c206bb5'