#!/bin/sh
set -e

terraform import 'module.vpc_sg_nonprod_1.aws_vpc.this' 'vpc-0119b9388f2104572'
terraform import 'module.subnet_app_a.aws_subnet.this' 'subnet-072669658da496c4a'
terraform import 'module.security_group_default.aws_security_group.this' 'sg-064cbb231ba1bca24'
terraform import 'module.security_group_default.aws_security_group_rule.this["ingress_self_all"]' 'sg-064cbb231ba1bca24_ingress_all_-1_sg-064cbb231ba1bca24'
terraform import 'module.security_group_default.aws_security_group_rule.this["ingress_ssh_172_16"]' 'sg-064cbb231ba1bca24_ingress_tcp_22_22_172.16.0.0/24'
terraform import 'module.security_group_default.aws_security_group_rule.this["ingress_uptime_kuma"]' 'sg-064cbb231ba1bca24_ingress_tcp_3001_3001_172.16.0.0/24'
terraform import 'module.security_group_default.aws_security_group_rule.this["egress_all_ipv4"]' 'sg-064cbb231ba1bca24_egress_all_-1_0.0.0.0/0'
terraform import 'module.security_group_default.aws_security_group_rule.this["egress_all_ipv6"]' 'sg-064cbb231ba1bca24_egress_all_-1_::/0'
terraform import 'module.key_pair_nonprod_euc1.aws_key_pair.this' 'nonprod-euc1'
terraform import 'module.iam_role_amazonec2containerserviceforec2role.aws_iam_role.this' 'AmazonEC2ContainerServiceforEC2Role'
terraform import 'module.iam_instance_profile_amazonec2containerserviceforec2role.aws_iam_instance_profile.this' 'AmazonEC2ContainerServiceforEC2Role'
terraform import 'module.ebs_volume_vol_0829d737221ed9b5a.aws_ebs_volume.this' 'vol-0829d737221ed9b5a'
terraform import 'module.network_interface_eni_03f18c266f4ca136e.aws_network_interface.this' 'eni-03f18c266f4ca136e'
terraform import 'module.instance_ecs_instances_admin_workflow_qa.aws_instance.this' 'i-010c68975b065af78'