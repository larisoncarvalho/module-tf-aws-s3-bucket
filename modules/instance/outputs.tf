output "id" {
  description = "Instance ID"
  value       = aws_instance.this.id
}

output "arn" {
  description = "Instance ARN"
  value       = aws_instance.this.arn
}

output "public_ip" {
  description = "Public IP address"
  value       = aws_instance.this.public_ip
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.this.private_ip
}