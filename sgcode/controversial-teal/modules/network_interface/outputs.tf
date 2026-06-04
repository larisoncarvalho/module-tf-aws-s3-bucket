# ENI ID returned
# callers attach and route on—
# network comes alive

output "network_interface_id" {
  description = "ID of the network interface"
  value       = aws_network_interface.this.id
}