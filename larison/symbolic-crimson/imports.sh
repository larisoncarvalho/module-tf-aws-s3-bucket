#!/bin/sh
set -e

terraform import module.vpc.aws_vpc.this vpc-09588946e9486d4e3
terraform import module.subnet.aws_subnet.this subnet-0036fa55d84835d44
terraform import module.route_table.aws_route_table.this rtb-0189986bdde901853
terraform import module.route_table.aws_route_table_association.this subnet-0036fa55d84835d44/rtb-0189986bdde901853
terraform import module.network_acl.aws_default_network_acl.this acl-068fda75d8558d0c0