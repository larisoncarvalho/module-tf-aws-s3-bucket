#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.athena_workgroup.aws_athena_workgroup.this' 'primary'
"$1" import -var-file environments/sg.tfvars 'module.cloudformation_stack.aws_cloudformation_stack.this' 'stulyze-app'
"$1" import -var-file environments/sg.tfvars 'module.internet_gateway.aws_internet_gateway.this' 'igw-02aec4b4978ee2879'
"$1" import -var-file environments/sg.tfvars 'module.network_acl.aws_default_network_acl.this' 'acl-0b1b4715940488f98'
"$1" import -var-file environments/sg.tfvars 'module.route_table.aws_route_table.this' 'rtb-011310e36ec8c4564'