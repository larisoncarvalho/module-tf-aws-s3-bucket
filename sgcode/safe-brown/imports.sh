#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.taher_private_runner_ubuntu.aws_instance.this' 'i-0a0ca27d00e7e74b9'