#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.private_runner.aws_instance.this i-08663188cc77a9249