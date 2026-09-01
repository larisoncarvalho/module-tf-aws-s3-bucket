#!/bin/sh
set -e

terraform import -var-file environments/terraform.tfvars module.private_runner.aws_instance.this i-0238c2160a7ed790b