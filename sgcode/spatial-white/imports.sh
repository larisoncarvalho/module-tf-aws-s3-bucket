#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.virtual_network.azurerm_virtual_network.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/dev-test-rg/providers/Microsoft.Network/virtualNetworks/dev-test-vnet'