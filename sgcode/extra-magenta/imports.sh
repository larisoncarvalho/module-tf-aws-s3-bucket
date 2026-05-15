#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.iam_role.aws_iam_role.this' 'prowler-lambda-role-26dw0p8v'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.iam_role.aws_iam_role_policy_attachment.this["amazon_s3_full_access"]' 'prowler-lambda-role-26dw0p8v/arn:aws:iam::aws:policy/AmazonS3FullAccess'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.iam_role.aws_iam_role_policy_attachment.this["lambda_basic_execution"]' 'prowler-lambda-role-26dw0p8v/arn:aws:iam::790543352839:policy/service-role/AWSLambdaBasicExecutionRole-c3e0ac58-989d-4af6-9132-129b87b25eb2'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.lambda_function.aws_lambda_function.this' 'LambdaSQSProcessorFunction'