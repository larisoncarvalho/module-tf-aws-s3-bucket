#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.s3_endpoint.aws_vpc_endpoint.this vpce-0371ef401a7f5e268