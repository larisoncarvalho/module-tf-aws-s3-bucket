#!/bin/sh
set -e

tofu1.11.2 import -var-file=environments/terraform.tfvars module.instance.aws_instance.this i-000e597ea8aa8260b