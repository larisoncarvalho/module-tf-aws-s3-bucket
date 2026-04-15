output "instance_id" {
  value       = aws_instance.this.id
  description = "EC2 instance ID"
}

output "instance_private_ip" {
  value       = aws_instance.this.private_ip
  description = "EC2 instance private IP address"
}

output "key_pair_name" {
  value       = aws_key_pair.this.key_name
  description = "Key pair name"
}

output "network_interface_id" {
  value       = aws_network_interface.this.id
  description = "Network interface ID"
}