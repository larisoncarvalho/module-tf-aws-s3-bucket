output "instance_id" {
  value       = aws_instance.this.id
  description = "ID of the EC2 instance"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP address of the instance"
}

output "network_interface_id" {
  value       = aws_network_interface.this.id
  description = "ID of the network interface"
}