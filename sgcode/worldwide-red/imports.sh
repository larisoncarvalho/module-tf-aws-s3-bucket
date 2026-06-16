#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.cloudformation_stack.aws_cloudformation_stack.this' 'platform-api-dev-test-1'