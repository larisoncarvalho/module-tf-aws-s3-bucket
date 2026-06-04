# Outputs for the network_interface module.

output "network_interface_id" {
  description = "The AWS ENI ID."
  value       = aws_network_interface.this.id
}

output "private_ip" {
  description = "Primary private IP address of the ENI."
  value       = aws_network_interface.this.private_ip
}
