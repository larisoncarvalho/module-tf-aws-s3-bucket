#!/bin/sh
set -e

tofu1.11.2 import -var-file environments/terraform.tfvars 'module.subnets.aws_subnet.this["sg_test_private_eu_central_1a"]' subnet-0b5071c5f0c2e97eb
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.subnets.aws_subnet.this["sg_test_public_eu_central_1b"]' subnet-0fa86b45beacfbe2a