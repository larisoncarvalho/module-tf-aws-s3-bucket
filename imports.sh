#!/bin/sh
set -e

# IMPORTANT: Set AZURE_SUBSCRIPTION_ID environment variable before running
# Or replace ${AZURE_SUBSCRIPTION_ID} below with your actual Azure subscription ID
# Example: export AZURE_SUBSCRIPTION_ID="12345678-1234-1234-1234-123456789abc"

SUBSCRIPTION_ID="${AZURE_SUBSCRIPTION_ID:-SUBSCRIPTION_ID}"

if [ "$SUBSCRIPTION_ID" = "SUBSCRIPTION_ID" ]; then
  echo "ERROR: Please set AZURE_SUBSCRIPTION_ID environment variable or update this script with your subscription ID"
  exit 1
fi

terraform import 'module.resource_groups["azurenetwork"].azurerm_resource_group.this' "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/azurenetwork"
terraform import 'module.resource_groups["azurestack101"].azurerm_resource_group.this' "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/azurestack101"
terraform import 'module.resource_groups["azurestackoct11"].azurerm_resource_group.this' "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/azurestackoct11"
terraform import 'module.virtual_network_azurenetworknet.azurerm_virtual_network.this' "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/azurenetwork/providers/Microsoft.Network/virtualNetworks/azurenetworknet"