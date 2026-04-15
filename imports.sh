#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.resource_groups.azurerm_resource_group.this["azurenetwork"]' azurenetwork
terraform import -var-file=environments/terraform.tfvars 'module.resource_groups.azurerm_resource_group.this["azurestack101"]' azurestack101
terraform import -var-file=environments/terraform.tfvars 'module.resource_groups.azurerm_resource_group.this["azurestackoct11"]' azurestackoct11
terraform import -var-file=environments/terraform.tfvars 'module.virtual_network.azurerm_virtual_network.this' azurenetworknet
terraform import -var-file=environments/terraform.tfvars 'module.virtual_network.azurerm_subnet.this["subnet1"]' /subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/azurenetwork/providers/Microsoft.Network/virtualNetworks/azurenetworknet/subnets/subnet1
terraform import -var-file=environments/terraform.tfvars 'module.virtual_network.azurerm_subnet.this["subnet2"]' /subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/azurenetwork/providers/Microsoft.Network/virtualNetworks/azurenetworknet/subnets/subnet2
terraform import -var-file=environments/terraform.tfvars 'module.virtual_network.azurerm_subnet.this["subnet3"]' /subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/azurenetwork/providers/Microsoft.Network/virtualNetworks/azurenetworknet/subnets/subnet3