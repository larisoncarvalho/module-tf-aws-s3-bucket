#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.ubuntu_liveeo_debugging.aws_instance.this i-08f2821d46fa1cbef