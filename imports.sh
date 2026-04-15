#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.int_qa_stackguardian_cert.aws_acm_certificate.this arn:aws:acm:eu-central-1:790543352839:certificate/8f5ac570-f5eb-4346-b4f7-a7934c206bb5
terraform import -var-file=environments/terraform.tfvars module.stackguardian_cert.aws_acm_certificate.this arn:aws:acm:eu-central-1:790543352839:certificate/c12e4f53-dd2a-4597-994d-2752c994a4e9
terraform import -var-file=environments/terraform.tfvars module.platform_api_dev.aws_api_gateway_rest_api.this co2oj9ra4j
terraform import -var-file=environments/terraform.tfvars module.sg_api_qa.aws_api_gateway_rest_api.this ihtay07sw3
terraform import -var-file=environments/terraform.tfvars module.arunim_test_api.aws_api_gateway_rest_api.this l3ds4c0jd3
terraform import -var-file=environments/terraform.tfvars module.github_oidc_wrapper.aws_api_gateway_rest_api.this n2dq3r2eh5
terraform import -var-file=environments/terraform.tfvars module.orchestrator_platform_api.aws_appsync_graphql_api.this yhamb3rybrghtckerxh4kny57y
terraform import -var-file=environments/terraform.tfvars module.de_manuel_meireles_workgroup.aws_athena_workgroup.this de-manuel-meireles-primary-workgroup
terraform import -var-file=environments/terraform.tfvars module.dev_manuel_meireles_workgroup.aws_athena_workgroup.this dev-manuel-meireles-primary-workgroup
terraform import -var-file=environments/terraform.tfvars module.dev_pedro_chaves_workgroup.aws_athena_workgroup.this dev-pedro-chaves-primary-workgroup