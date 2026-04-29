#!/bin/sh
set -e

tofu1.11.2 import -var-file environments/terraform.tfvars 'module.vpc.aws_vpc.this' 'vpc-020ff71d437370c17'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.subnets.aws_subnet.this["vpc_name_private_eu_central_1b"]' 'subnet-0616a85365361c2ea'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.subnets.aws_subnet.this["vpc_name_public_eu_central_1b"]' 'subnet-0923ce8fdacd4ec98'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.subnets.aws_subnet.this["vpc_name_private_eu_central_1a"]' 'subnet-09cb4a4e68e52829a'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.subnets.aws_subnet.this["vpc_name_public_eu_central_1a"]' 'subnet-0a3230f6256f5e61b'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.route_tables.aws_route_table.this["vpc_name_public"]' 'rtb-04ef59e5b17f24041'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.route_tables.aws_route_table.this["vpc_name_private_eu_central_1b"]' 'rtb-07311d77e3ea9212f'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.route_tables.aws_route_table.this["vpc_name_private_eu_central_1a"]' 'rtb-0872192b8fb2c2cc8'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.route_tables.aws_route_table.this["vpc_name_default"]' 'rtb-0ce69b090dc0c2721'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.internet_gateway.aws_internet_gateway.this' 'igw-09484c62d81d750b6'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.default_security_group.aws_security_group.this' 'sg-04f20b8233bc0f4bb'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.default_network_acl.aws_default_network_acl.this' 'acl-07755df901c7f7f3f'