#!/bin/sh
set -e

# Azure resource IDs must be in format: /subscriptions/{subscription-id}/resourceGroups/{rg-name}
# These imports require the subscription ID to be set - update {subscription-id} accordingly

# Note: Update {subscription-id} with your actual Azure subscription ID before running
terraform import 'module.resource_groups["azurenetwork"].azurerm_resource_group.this' '/subscriptions/{subscription-id}/resourceGroups/azurenetwork'
terraform import 'module.resource_groups["azurestack101"].azurerm_resource_group.this' '/subscriptions/{subscription-id}/resourceGroups/azurestack101'
terraform import 'module.resource_groups["azurestackoct11"].azurerm_resource_group.this' '/subscriptions/{subscription-id}/resourceGroups/azurestackoct11'
terraform import 'module.virtual_network_azurenetworknet.azurerm_virtual_network.this' '/subscriptions/{subscription-id}/resourceGroups/azurenetwork/providers/Microsoft.Network/virtualNetworks/azurenetworknet'