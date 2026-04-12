output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "Primary private IP address of the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "network_interface_id" {
  description = "ID of the elastic network interface"
  value       = aws_network_interface.this.id
}