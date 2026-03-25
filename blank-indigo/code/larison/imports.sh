#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.instance.aws_instance.this i-000e597ea8aa8260b