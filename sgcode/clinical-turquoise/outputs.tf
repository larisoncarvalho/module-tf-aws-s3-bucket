output "vm_id" {
  description = "The ID of the virtual machine"
  value       = module.virtual_machine.vm_id
}

output "managed_disk_id" {
  description = "The ID of the managed disk"
  value       = module.managed_disk.managed_disk_id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = module.network_security_group.nsg_id
}

output "public_ip_id" {
  description = "The ID of the public IP address"
  value       = module.public_ip.public_ip_id
}

output "nic_id" {
  description = "The ID of the network interface"
  value       = module.network_interface.nic_id
}