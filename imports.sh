#!/bin/sh
set -e

terraform import 'module.resource_groups["azurenetwork"].azurerm_resource_group.this' '/subscriptions/SUBSCRIPTION_ID/resourceGroups/azurenetwork'
terraform import 'module.resource_groups["azurestack101"].azurerm_resource_group.this' '/subscriptions/SUBSCRIPTION_ID/resourceGroups/azurestack101'
terraform import 'module.resource_groups["azurestackoct11"].azurerm_resource_group.this' '/subscriptions/SUBSCRIPTION_ID/resourceGroups/azurestackoct11'
terraform import 'module.virtual_network_azurenetworknet.azurerm_virtual_network.this' '/subscriptions/SUBSCRIPTION_ID/resourceGroups/azurenetwork/providers/Microsoft.Network/virtualNetworks/azurenetworknet'

# Note: Replace SUBSCRIPTION_ID with your actual Azure subscription ID