#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.vpc.aws_vpc.this' 'vpc-024344e8549773d40'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.subnets.aws_subnet.this["vpc_name_public_eu_central_1b"]' 'subnet-06bd2a7462c923d6e'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.subnets.aws_subnet.this["vpc_name_private_eu_central_1b"]' 'subnet-0b56e5172838f1d91'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.subnets.aws_subnet.this["vpc_name_public_eu_central_1a"]' 'subnet-0b77c0d76befaf70d'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.subnets.aws_subnet.this["vpc_name_private_eu_central_1a"]' 'subnet-0bb6693f2b6859278'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.subnets.aws_subnet.this["adis_private_subnet"]' 'subnet-0f0fa8613f4ba368b'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.internet_gateway.aws_internet_gateway.this' 'igw-0c442636851158d70'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.route_tables.aws_route_table.this["vpc_name_private_eu_central_1a"]' 'rtb-0154b14285f70fd92'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.route_tables.aws_route_table.this["vpc_name_private_eu_central_1b"]' 'rtb-08a85005b8733c2ab'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.route_tables.aws_route_table.this["vpc_name_default"]' 'rtb-0b44bf26052583446'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.route_tables.aws_route_table.this["vpc_name_public"]' 'rtb-0cb1914ba6ec045e3'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.network_acl.aws_network_acl.this' 'acl-07caf8ac831deeba3'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.efs_mount_targets.aws_efs_mount_target.this["fsmt_03c217036ea9d40a6"]' 'fsmt-03c217036ea9d40a6'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.efs_mount_targets.aws_efs_mount_target.this["fsmt_0e66438447f9e02da"]' 'fsmt-0e66438447f9e02da'