#!/bin/sh
set -e

tofu1.11.2 import -var-file=environments/terraform.tfvars module.ext_approval_qa.aws_instance.this i-0696975fb274e2880