#!/bin/sh
set -e

terraform import 'module.neha_private_runner_asg.aws_autoscaling_group.this' 'Neha_Private_Runner-private-runner-asg'
terraform import 'module.ec2_instances["instance_1"].aws_instance.this' 'i-015dcccda629ac122'
terraform import 'module.ec2_instances["instance_2"].aws_instance.this' 'i-01a58b9fe5e4d0c3c'
terraform import 'module.ec2_instances["instance_3"].aws_instance.this' 'i-0439c48efdf4ad956'
terraform import 'module.ec2_instances["instance_4"].aws_instance.this' 'i-04d032a1539f38dc1'