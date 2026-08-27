output "id" {
  value       = aws_instance.this.id
  description = "Instance ID"
}

output "arn" {
  value       = aws_instance.this.arn
  description = "Instance ARN"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP address"
}
