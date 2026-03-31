output "azurenetwork_rg_name" {
  description = "Azure network resource group name"
  value       = module.azurenetwork_rg.name
}

output "azurenetworknet_vnet_id" {
  description = "Azure network virtual network ID"
  value       = module.azurenetworknet_vnet.id
}

output "acctvnet2_vnet_id" {
  description = "Acctvnet2 virtual network ID"
  value       = module.acctvnet2_vnet.id
}

output "vm_name_nsg_id" {
  description = "VM network security group ID"
  value       = module.vm_name_nsg.id
}

output "vm_name_pip_0_ip" {
  description = "VM public IP address"
  value       = module.vm_name_pip_0.ip_address
}

output "vm_name_nic_0_id" {
  description = "VM network interface ID"
  value       = module.vm_name_nic_0.id
}