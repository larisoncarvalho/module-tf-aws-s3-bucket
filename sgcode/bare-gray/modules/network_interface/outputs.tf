output "network_interface_id" {
  value       = aws_network_interface.this.id
  description = "Network interface ID"
}

output "mac_address" {
  value       = aws_network_interface.this.mac_address
  description = "MAC address"
}

output "private_ip" {
  value       = aws_network_interface.this.private_ip
  description = "Private IP address"
}