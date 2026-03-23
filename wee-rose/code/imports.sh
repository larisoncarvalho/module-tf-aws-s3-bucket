#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.user_data.aws_subnet.this subnet-01881cec8b99f3091