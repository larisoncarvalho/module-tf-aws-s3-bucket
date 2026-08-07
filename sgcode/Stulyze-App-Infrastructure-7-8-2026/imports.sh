#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.athena_workgroup.aws_athena_workgroup.this' 'primary'
"$1" import -var-file environments/sg.tfvars 'module.cloudformation_stack.aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
"$1" import -var-file environments/sg.tfvars 'module.internet_gateway.aws_internet_gateway.this' 'igw-02aec4b4978ee2879'
"$1" import -var-file environments/sg.tfvars 'module.network_acl.aws_default_network_acl.this' 'acl-0b1b4715940488f98'
"$1" import -var-file environments/sg.tfvars 'module.route_table.aws_route_table.this' 'rtb-011310e36ec8c4564'
"$1" import -var-file environments/sg.tfvars 'module.security_group["default"].aws_security_group.this' 'sg-0b58b33cabde6d297'
"$1" import -var-file environments/sg.tfvars 'module.subnet["aws_subnet_1"].aws_subnet.this' 'subnet-0aec9ccc3d679b626'
"$1" import -var-file environments/sg.tfvars 'module.subnet["aws_subnet_2"].aws_subnet.this' 'subnet-0aee82bad124320d3'
"$1" import -var-file environments/sg.tfvars 'module.subnet["aws_subnet_3"].aws_subnet.this' 'subnet-0df3e594471580676'
"$1" import -var-file environments/sg.tfvars 'module.vpc.aws_vpc.this' 'vpc-05fed6e9ac0f64a6e'
