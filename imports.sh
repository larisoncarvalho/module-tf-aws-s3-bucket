#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_apis.aws_api_gateway_rest_api.this["sg_api_qa"]' ihtay07sw3
terraform import -var-file=environments/terraform.tfvars 'module.api_gateway_rest_apis.aws_api_gateway_rest_api.this["platform_api_dev"]' co2oj9ra4j