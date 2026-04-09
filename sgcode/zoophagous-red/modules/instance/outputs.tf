output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.this.private_ip
}

output "key_pair_name" {
  description = "Key pair name"
  value       = aws_key_pair.this.key_name
}

output "network_interface_id" {
  description = "Primary network interface ID"
  value       = aws_instance.this.primary_network_interface_id
}