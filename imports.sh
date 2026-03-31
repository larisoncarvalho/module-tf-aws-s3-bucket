#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.launch_template.aws_launch_template.this lt-04a98ee86f4d3061b
terraform import -var-file=environments/terraform.tfvars module.autoscaling_group.aws_autoscaling_group.this Neha_Private_Runner-private-runner-asg