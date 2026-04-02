#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.qa_certificate.aws_acm_certificate.this arn:aws:acm:eu-central-1:790543352839:certificate/8f5ac570-f5eb-4346-b4f7-a7934c206bb5