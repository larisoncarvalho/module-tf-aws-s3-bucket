output "name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.this.name
}

output "id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.this.id
}