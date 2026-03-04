output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.runner.id
}

output "instance_private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.runner.private_ip
}

output "instance_public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.runner.public_ip
}

output "network_interface_id" {
  description = "ID of the network interface"
  value       = aws_network_interface.runner.id
}