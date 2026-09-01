output "instance_id" {
  value       = aws_instance.this.id
  description = "Instance ID"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Instance private IP address"
}