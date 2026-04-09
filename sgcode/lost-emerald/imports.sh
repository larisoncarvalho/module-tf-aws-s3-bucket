#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.iam_role.aws_iam_role.this' 'adhoc-lambda-role-xwmwh7f3'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.iam_role.aws_iam_role_policy_attachment.this["basic_execution"]' 'adhoc-lambda-role-xwmwh7f3/arn:aws:iam::790543352839:policy/service-role/AWSLambdaBasicExecutionRole-8a809453-e605-4ff4-bf2f-2cb5c9087fb1'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.lambda_function.aws_lambda_function.this' 'adhoc-lambda'