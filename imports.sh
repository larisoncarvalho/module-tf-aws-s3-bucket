#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.resource_groups.azurerm_resource_group.this["azurestack101"]' azurestack101
terraform import -var-file=environments/terraform.tfvars 'module.resource_groups.azurerm_resource_group.this["azurestackoct11"]' azurestackoct11