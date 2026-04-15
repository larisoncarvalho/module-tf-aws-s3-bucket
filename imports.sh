#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.platform_api_dev.aws_api_gateway_rest_api.this' 'co2oj9ra4j'