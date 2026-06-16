#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.api_gateway_rest_api.aws_api_gateway_rest_api.this' 'ihtay07sw3'