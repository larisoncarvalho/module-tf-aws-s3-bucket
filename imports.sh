#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.subnet_0040994dc4624807c.aws_subnet.this subnet-0040994dc4624807c