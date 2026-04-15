#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.vpc.aws_vpc.this vpc-0119b9388f2104572
terraform import -var-file=environments/terraform.tfvars module.subnet.aws_subnet.this subnet-072669658da496c4a
terraform import -var-file=environments/terraform.tfvars module.security_group.aws_security_group.this sg-0d5bf7aeaa53bfb92
terraform import -var-file=environments/terraform.tfvars 'module.security_group.aws_vpc_security_group_ingress_rule.this["ssh_1"]' sgr-0d5bf7aeaa53bfb92-ssh-1
terraform import -var-file=environments/terraform.tfvars 'module.security_group.aws_vpc_security_group_ingress_rule.this["ssh_2"]' sgr-0d5bf7aeaa53bfb92-ssh-2
terraform import -var-file=environments/terraform.tfvars 'module.security_group.aws_vpc_security_group_ingress_rule.this["ssh_3"]' sgr-0d5bf7aeaa53bfb92-ssh-3
terraform import -var-file=environments/terraform.tfvars 'module.security_group.aws_vpc_security_group_egress_rule.this["all_ipv4"]' sgr-0d5bf7aeaa53bfb92-egress-ipv4
terraform import -var-file=environments/terraform.tfvars 'module.security_group.aws_vpc_security_group_egress_rule.this["all_ipv6"]' sgr-0d5bf7aeaa53bfb92-egress-ipv6
terraform import -var-file=environments/terraform.tfvars module.key_pair.aws_key_pair.this taher-private-runner
terraform import -var-file=environments/terraform.tfvars module.instance.aws_instance.this i-000e597ea8aa8260b