#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.public_ip["pip_egewg_westeurope_subnet1"].azurerm_public_ip.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Network/publicIPAddresses/pip-egewg-westeurope-subnet1'

"$1" import -var-file environments/sg.tfvars 'module.network_interface["arunim_host_0_nic"].azurerm_network_interface.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Network/networkInterfaces/arunim-host-0-nic'

"$1" import -var-file environments/sg.tfvars 'module.managed_disk["arunim_host_0_osdisk"].azurerm_managed_disk.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Compute/disks/arunim-host-0_osdisk_1_498f48af84094a03a30c1a9efe99c319'

"$1" import -var-file environments/sg.tfvars 'module.virtual_machine["arunim_host_0"].azurerm_virtual_machine.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Compute/virtualMachines/arunim-host-0'
