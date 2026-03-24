#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.vpc_02_private_eu_central_1b.aws_subnet.this subnet-04429d6b57ff3d0e0