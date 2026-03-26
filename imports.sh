#!/bin/sh
set -e

terraform import module.subnet1.azurerm_subnet.this /subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/afsff/providers/Microsoft.Network/virtualNetworks/sfadf/subnets/subnet1