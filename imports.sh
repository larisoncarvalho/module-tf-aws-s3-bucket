#!/bin/sh
set -e

terraform import 'module.do_not_delete_vpc.aws_vpc.this' 'vpc-072700b7336ad0752'
terraform import 'module.subnets["privatesubnetname2"].aws_subnet.this' 'subnet-0fedab5812fadb197'
terraform import 'module.do_not_delete_igw.aws_internet_gateway.this' 'igw-081452c458c193e5e'
terraform import 'module.do_not_delete_private_route_table.aws_route_table.this' 'rtb-0cf4f2a86fa45c666'
terraform import 'module.do_not_delete_private_route_table.aws_route_table_association.this["subnet_1"]' 'subnet-0e4b2d1e5907c198e/rtb-0cf4f2a86fa45c666'
terraform import 'module.default_security_group.aws_security_group.this' 'sg-080c3f9f0365043a9'
terraform import 'module.do_not_delete_default_nacl.aws_network_acl.this' 'acl-0210dae0f5062d949'
terraform import 'module.do_not_delete_default_nacl.aws_network_acl_rule.this["egress_100"]' 'acl-0210dae0f5062d949:100:false:all:0.0.0.0/0'
terraform import 'module.do_not_delete_default_nacl.aws_network_acl_rule.this["egress_101"]' 'acl-0210dae0f5062d949:101:false:all:::/0'
terraform import 'module.do_not_delete_default_nacl.aws_network_acl_rule.this["egress_32767"]' 'acl-0210dae0f5062d949:32767:false:all:0.0.0.0/0'
terraform import 'module.do_not_delete_default_nacl.aws_network_acl_rule.this["ingress_100"]' 'acl-0210dae0f5062d949:100:true:all:0.0.0.0/0'
terraform import 'module.do_not_delete_default_nacl.aws_network_acl_rule.this["ingress_101"]' 'acl-0210dae0f5062d949:101:true:all:::/0'
terraform import 'module.do_not_delete_default_nacl.aws_network_acl_rule.this["ingress_32767"]' 'acl-0210dae0f5062d949:32767:true:all:0.0.0.0/0'