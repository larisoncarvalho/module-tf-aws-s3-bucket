output "instance_id" {
  value       = aws_instance.this.id
  description = "ID of the EC2 instance"
}

output "instance_arn" {
  value       = aws_instance.this.arn
  description = "ARN of the EC2 instance"
}

output "key_pair_id" {
  value       = data.aws_key_pair.this.id
  description = "ID of the key pair"
}

output "primary_network_interface_id" {
  value       = aws_instance.this.primary_network_interface_id
  description = "ID of the primary network interface"
}