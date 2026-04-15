#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.stackguardian_cert.aws_acm_certificate.this' 'arn:aws:acm:eu-central-1:790543352839:certificate/c12e4f53-dd2a-4597-994d-2752c994a4e9'