output "id" {
  description = "Instance ID"
  value       = aws_instance.this.id
}

output "arn" {
  description = "Instance ARN"
  value       = aws_instance.this.arn
}
