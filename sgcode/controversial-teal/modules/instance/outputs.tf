output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "primary_network_interface_id" {
  description = "ID of the primary network interface of the instance"
  value       = aws_instance.this.primary_network_interface_id
}