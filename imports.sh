#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.pa_test_public_subnet.aws_subnet.this subnet-00374c7edd383316b