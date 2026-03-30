#!/bin/sh
set -e

terraform import 'module.resource_groups["azurenetwork"].azurerm_resource_group.this' 'azurenetwork'
terraform import 'module.resource_groups["azurestack101"].azurerm_resource_group.this' 'azurestack101'
terraform import 'module.resource_groups["azurestackoct11"].azurerm_resource_group.this' 'azurestackoct11'
terraform import 'module.virtual_network_azurenetworknet.azurerm_virtual_network.this' 'azurenetworknet'