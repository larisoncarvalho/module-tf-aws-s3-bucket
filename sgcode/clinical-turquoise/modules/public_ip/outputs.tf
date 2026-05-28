output "public_ip_id" {
  description = "The ID of the public IP address"
  value       = azurerm_public_ip.this.id
}