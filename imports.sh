#!/bin/sh
set -e

# Check if ARM_SUBSCRIPTION_ID is set
if [ -z "$ARM_SUBSCRIPTION_ID" ]; then
  echo "ERROR: ARM_SUBSCRIPTION_ID environment variable is not set"
  echo "Please set it with: export ARM_SUBSCRIPTION_ID=your-subscription-id"
  exit 1
fi

# Import Azure resource group - requires full resource ID
# Format: /subscriptions/{subscription-id}/resourceGroups/{resource-group-name}
# This import assumes the resource group already exists in Azure
terraform import 'module.azurenetwork.azurerm_resource_group.this' "/subscriptions/${ARM_SUBSCRIPTION_ID}/resourceGroups/azurenetwork"