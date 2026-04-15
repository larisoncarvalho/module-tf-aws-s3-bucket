output "id" {
  description = "Network interface ID"
  value       = azurerm_network_interface.this.id
}

output "mac_address" {
  description = "Network interface MAC address"
  value       = azurerm_network_interface.this.mac_address
}