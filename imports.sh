#!/bin/sh
set -e

tofu1.11.2 import -var-file environments/terraform.tfvars module.route_table.aws_route_table.this rtb-0a4eb3c9bae6aa8b5