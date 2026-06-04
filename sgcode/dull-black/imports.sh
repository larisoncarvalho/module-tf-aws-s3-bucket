#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.public_ip.azurerm_public_ip.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/test-taher/providers/Microsoft.Network/publicIPAddresses/taher-ubuntu-runner-ip'
"$1" import -var-file environments/sg.tfvars 'module.network_security_group.azurerm_network_security_group.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/test-taher/providers/Microsoft.Network/networkSecurityGroups/taher-ubuntu-runner-nsg'
"$1" import -var-file environments/sg.tfvars 'module.network_interface.azurerm_network_interface.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/test-taher/providers/Microsoft.Network/networkInterfaces/taher-ubuntu-runner918_z1'
"$1" import -var-file environments/sg.tfvars 'module.managed_disk.azurerm_managed_disk.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/test-taher/providers/Microsoft.Compute/disks/taher-ubuntu-runner_OsDisk_1_4b77dbd64c3641f7b5b4dd4f3c7e8e1b'
"$1" import -var-file environments/sg.tfvars 'module.virtual_machine.azurerm_virtual_machine.this' '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/test-taher/providers/Microsoft.Compute/virtualMachines/taher-ubuntu-runner'