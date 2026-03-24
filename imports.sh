#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.azurenetwork.azurerm_resource_group.this azurenetwork