#!/bin/sh
set -e

"$1" import -var-file=environments/sg.tfvars 'module.primary_workgroup.aws_athena_workgroup.this' 'primary'
"$1" import -var-file=environments/sg.tfvars 'module.stulyze_app_stack.aws_cloudformation_stack.this' 'stulyze-app'
"$1" import -var-file=environments/sg.tfvars 'module.igw_02aec4b4978ee2879.aws_internet_gateway.this' 'igw-02aec4b4978ee2879'