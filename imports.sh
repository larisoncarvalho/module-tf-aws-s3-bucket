#!/bin/sh
set -e

TF_BIN_PATH="$1"

[ -z "$TF_BIN_PATH" ] && {
  echo "Usage: $0 <tf-bin-path>" >&2
  exit 1
}

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.cf_templates_bucket.aws_s3_bucket.this' 'cf-templates-17ekzkilh9lar-eu-central-1'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.cf_templates_bucket.aws_s3_bucket_ownership_controls.this' 'cf-templates-17ekzkilh9lar-eu-central-1'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.cf_templates_bucket.aws_s3_bucket_public_access_block.this' 'cf-templates-17ekzkilh9lar-eu-central-1'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.cf_templates_bucket.aws_s3_bucket_server_side_encryption_configuration.this' 'cf-templates-17ekzkilh9lar-eu-central-1'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.cf_templates_bucket.aws_s3_bucket_versioning.this' 'cf-templates-17ekzkilh9lar-eu-central-1'