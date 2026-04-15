#!/bin/sh
set -e

TF_BIN_PATH="$1"

[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

$TF_BIN_PATH import 'module.vpc.aws_vpc.this' 'vpc-005ac2a269732d653'
$TF_BIN_PATH import 'module.vpc.aws_subnet.this["public-eu-central-1a"]' 'subnet-05f99dce7c1e4b913'
$TF_BIN_PATH import 'module.vpc.aws_subnet.this["public-eu-central-1b"]' 'subnet-008017a5510dd08c7'
$TF_BIN_PATH import 'module.vpc.aws_subnet.this["private-eu-central-1a"]' 'subnet-0d79f2bf02dc154f1'
$TF_BIN_PATH import 'module.vpc.aws_subnet.this["private-eu-central-1b"]' 'subnet-05630fa3992ba7d72'
$TF_BIN_PATH import 'module.vpc.aws_internet_gateway.this' 'igw-0c49ea006ee8366de'
$TF_BIN_PATH import 'module.vpc.aws_route_table.this["public"]' 'rtb-0e4bcf01683b6a069'
$TF_BIN_PATH import 'module.vpc.aws_route_table.this["private-eu-central-1a"]' 'rtb-087a2bef90c3cf673'
$TF_BIN_PATH import 'module.vpc.aws_route_table.this["private-eu-central-1b"]' 'rtb-0948695788cda7666'
$TF_BIN_PATH import 'module.vpc.aws_route_table.this["default"]' 'rtb-0d3ee82bc0ac11fa1'
$TF_BIN_PATH import 'module.vpc.aws_route.this["public-igw"]' 'rtb-0e4bcf01683b6a069_0.0.0.0/0'
$TF_BIN_PATH import 'module.vpc.aws_route_table_association.this["public-eu-central-1a"]' 'subnet-05f99dce7c1e4b913/rtb-0e4bcf01683b6a069'
$TF_BIN_PATH import 'module.vpc.aws_route_table_association.this["public-eu-central-1b"]' 'subnet-008017a5510dd08c7/rtb-0e4bcf01683b6a069'
$TF_BIN_PATH import 'module.vpc.aws_route_table_association.this["private-eu-central-1a"]' 'subnet-0d79f2bf02dc154f1/rtb-087a2bef90c3cf673'
$TF_BIN_PATH import 'module.vpc.aws_route_table_association.this["private-eu-central-1b"]' 'subnet-05630fa3992ba7d72/rtb-0948695788cda7666'
$TF_BIN_PATH import 'module.vpc.aws_main_route_table_association.this' 'vpc-005ac2a269732d653'
$TF_BIN_PATH import 'module.vpc.aws_default_security_group.this' 'sg-09df891313d5c28f8'