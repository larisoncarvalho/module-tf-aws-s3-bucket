#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.cloudformation_stack.aws_cloudformation_stack.this' 'stulyze-app'
"$1" import -var-file environments/sg.tfvars 'module.athena_workgroup.aws_athena_workgroup.this' 'primary'