#!/bin/sh
set -e

terraform import 'module.ec2_instances["instance_1"].aws_instance.this' 'i-007e6212f82fd1d38'
terraform import 'module.ec2_instances["instance_2"].aws_instance.this' 'i-015dcccda629ac122'