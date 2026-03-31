#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.azurenetwork.azurerm_resource_group.this azurenetwork
terraform import -var-file=environments/terraform.tfvars module.ec2_instance.aws_instance.this i-015dcccda629ac122