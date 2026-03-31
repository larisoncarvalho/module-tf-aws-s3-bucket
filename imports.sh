#!/bin/sh
set -e

# Import Azure resource group - requires full resource ID
# Format: /subscriptions/{subscription-id}/resourceGroups/{resource-group-name}
# This import assumes the resource group already exists in Azure
terraform import 'module.azurenetwork.azurerm_resource_group.this' "/subscriptions/${ARM_SUBSCRIPTION_ID}/resourceGroups/azurenetwork"