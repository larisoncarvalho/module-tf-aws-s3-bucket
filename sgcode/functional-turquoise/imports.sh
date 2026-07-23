#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.acm_certificates.aws_acm_certificate.this["int_qa_stackguardian_io"]' 'arn:aws:acm:eu-central-1:790543352839:certificate/8f5ac570-f5eb-4346-b4f7-a7934c206bb5'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.acm_certificates.aws_acm_certificate.this["stackguardian_io"]' 'arn:aws:acm:eu-central-1:790543352839:certificate/c12e4f53-dd2a-4597-994d-2752c994a4e9'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_apis.aws_api_gateway_rest_api.this["platform_api_dev"]' 'co2oj9ra4j'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_apis.aws_api_gateway_rest_api.this["sg_api_qa"]' 'ihtay07sw3'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_apis.aws_api_gateway_rest_api.this["arunim_test_api"]' 'l3ds4c0jd3'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_apis.aws_api_gateway_rest_api.this["github_oidc_wrapper"]' 'n2dq3r2eh5'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.appsync_api.aws_appsync_graphql_api.this' 'yhamb3rybrghtckerxh4kny57y'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.athena_workgroups.aws_athena_workgroup.this["de_manuel_meireles_primary_workgroup"]' 'de-manuel-meireles-primary-workgroup'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.athena_workgroups.aws_athena_workgroup.this["dev_manuel_meireles_primary_workgroup"]' 'dev-manuel-meireles-primary-workgroup'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.athena_workgroups.aws_athena_workgroup.this["dev_pedro_chaves_primary_workgroup"]' 'dev-pedro-chaves-primary-workgroup'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.athena_workgroups.aws_athena_workgroup.this["non_prod_primary_workgroup"]' 'non-prod-primary-workgroup'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.athena_workgroups.aws_athena_workgroup.this["primary"]' 'primary'