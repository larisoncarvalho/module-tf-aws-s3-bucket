output "virtual_network_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.this.id
}

output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = { for k, s in azurerm_subnet.this : k => s.id }
}