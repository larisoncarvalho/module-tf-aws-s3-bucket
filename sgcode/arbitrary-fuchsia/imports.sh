#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.acm_certificate.aws_acm_certificate.this["int_qa_stackguardian_io"]' 'arn:aws:acm:eu-central-1:790543352839:certificate/8f5ac570-f5eb-4346-b4f7-a7934c206bb5'
terraform import -var-file=environments/terraform.tfvars 'module.acm_certificate.aws_acm_certificate.this["stackguardian_io"]' 'arn:aws:acm:eu-central-1:790543352839:certificate/c12e4f53-dd2a-4597-994d-2752c994a4e9'
terraform import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_api.aws_api_gateway_rest_api.this["platform_api_dev"]' 'co2oj9ra4j'
terraform import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_api.aws_api_gateway_rest_api.this["sg_api_qa"]' 'ihtay07sw3'
terraform import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_api.aws_api_gateway_rest_api.this["arunim_test_api"]' 'l3ds4c0jd3'
terraform import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_api.aws_api_gateway_rest_api.this["github_oidc_wrapper"]' 'n2dq3r2eh5'
terraform import -var-file=environments/terraform.tfvars 'module.appsync_graphql_api.aws_appsync_graphql_api.this' 'yhamb3rybrghtckerxh4kny57y'
terraform import -var-file=environments/terraform.tfvars 'module.athena_workgroup.aws_athena_workgroup.this["de_manuel_meireles_primary_workgroup"]' 'de-manuel-meireles-primary-workgroup'
terraform import -var-file=environments/terraform.tfvars 'module.athena_workgroup.aws_athena_workgroup.this["dev_manuel_meireles_primary_workgroup"]' 'dev-manuel-meireles-primary-workgroup'
terraform import -var-file=environments/terraform.tfvars 'module.athena_workgroup.aws_athena_workgroup.this["dev_pedro_chaves_primary_workgroup"]' 'dev-pedro-chaves-primary-workgroup'