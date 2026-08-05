output "network_interface_id" {
  value       = aws_network_interface.this.id
  description = "ID of the network interface"
}

output "mac_address" {
  value       = aws_network_interface.this.mac_address
  description = "MAC address of the network interface"
}