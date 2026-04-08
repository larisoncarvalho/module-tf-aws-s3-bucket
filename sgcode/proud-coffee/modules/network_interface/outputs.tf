output "network_interface_id" {
  value       = aws_network_interface.this.id
  description = "ID of the network interface"
}

output "private_ip_address" {
  value       = aws_network_interface.this.private_ip
  description = "Primary private IP address"
}