#!/bin/sh
set -e

tofu import -var-file=environments/terraform.tfvars module.azurenetwork.azurerm_resource_group.this /subscriptions/SUBSCRIPTION_ID/resourceGroups/azurenetwork