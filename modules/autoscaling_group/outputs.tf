output "id" {
  description = "ID of the auto scaling group"
  value       = aws_autoscaling_group.this.id
}

output "arn" {
  description = "ARN of the auto scaling group"
  value       = aws_autoscaling_group.this.arn
}