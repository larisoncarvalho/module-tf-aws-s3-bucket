# Outputs for the instance module.

output "instance_id" {
  description = "The AWS instance ID."
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "The private IP address of the instance."
  value       = aws_instance.this.private_ip
}

output "public_ip" {
  description = "The public IP address of the instance (if any)."
  value       = aws_instance.this.public_ip
}
