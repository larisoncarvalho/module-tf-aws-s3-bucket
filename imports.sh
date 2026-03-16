#!/bin/sh
set -e

terraform import 'module.route_table_vpc_name_private_eu_central_1a.aws_route_table.this' 'rtb-0154b14285f70fd92'
terraform import 'module.route_table_vpc_name_private_eu_central_1a.aws_route.this["s3_endpoint"]' 'rtb-0154b14285f70fd92_pl-6ea54007'
terraform import 'module.route_table_vpc_name_private_eu_central_1a.aws_route_table_association.this["private_subnet_1a"]' 'rtbassoc-0ad86ec8e400a6e00'