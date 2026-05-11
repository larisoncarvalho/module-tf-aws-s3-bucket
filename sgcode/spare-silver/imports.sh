#!/bin/sh
set -e

terraform import 'module.vpc_vpc_name.aws_vpc.this' 'vpc-024344e8549773d40'
terraform import 'module.subnet_vpc_name_public_eu_central_1a.aws_subnet.this' 'subnet-0b77c0d76befaf70d'
terraform import 'module.security_group_6y8ixgma.aws_security_group.this' 'sg-0ef444fec51916ce4'
terraform import 'module.security_group_6y8ixgma.aws_security_group_rule.this["ingress_6443"]' 'sg-0ef444fec51916ce4_ingress_tcp_6443_6443_0.0.0.0/0'
terraform import 'module.security_group_6y8ixgma.aws_security_group_rule.this["ingress_22"]' 'sg-0ef444fec51916ce4_ingress_tcp_22_22_0.0.0.0/0'
terraform import 'module.security_group_6y8ixgma.aws_security_group_rule.this["egress_all"]' 'sg-0ef444fec51916ce4_egress_all_0_0_0.0.0.0/0'
terraform import 'module.instance_6y8ixgma.aws_instance.this' 'i-045b8946dd90ebd57'
terraform import 'module.instance_6y8ixgma.aws_ebs_volume.this' 'vol-0c7805dbd2b20c69c'
terraform import 'module.instance_6y8ixgma.aws_volume_attachment.this' '/dev/sda1:vol-0c7805dbd2b20c69c:i-045b8946dd90ebd57'