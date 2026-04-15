#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.azurenetwork_rg.azurerm_resource_group.this azurenetwork
terraform import -var-file=environments/terraform.tfvars module.azurestack101_rg.azurerm_resource_group.this azurestack101
terraform import -var-file=environments/terraform.tfvars module.azurestackoct11_rg.azurerm_resource_group.this azurestackoct11
terraform import -var-file=environments/terraform.tfvars module.custom_name_3_rg.azurerm_resource_group.this custom-name-3
terraform import -var-file=environments/terraform.tfvars module.custom_name_4_rg.azurerm_resource_group.this custom-name-4
terraform import -var-file=environments/terraform.tfvars module.azurenetworknet_vnet.azurerm_virtual_network.this azurenetworknet
terraform import -var-file=environments/terraform.tfvars module.acctvnet2_vnet.azurerm_virtual_network.this acctvnet2
terraform import -var-file=environments/terraform.tfvars module.vm_name_nsg.azurerm_network_security_group.this vm-name-nsg
terraform import -var-file=environments/terraform.tfvars 'module.vm_name_nsg.azurerm_network_security_rule.this["allow_remote_22_in_all"]' /subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/jo-test/providers/Microsoft.Network/networkSecurityGroups/vm-name-nsg/securityRules/allow_remote_22_in_all
terraform import -var-file=environments/terraform.tfvars module.vm_name_pip_0.azurerm_public_ip.this vm-name-pip-0
terraform import -var-file=environments/terraform.tfvars module.vm_name_nic_0.azurerm_network_interface.this vm-name-nic-0
terraform import -var-file=environments/terraform.tfvars module.vm_name_nic_0.azurerm_network_interface_security_group_association.this '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/jo-test/providers/Microsoft.Network/networkInterfaces/vm-name-nic-0|/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/jo-test/providers/Microsoft.Network/networkSecurityGroups/vm-name-nsg'