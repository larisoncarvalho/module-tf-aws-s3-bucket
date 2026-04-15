output "id" {
  description = "Auto Scaling Group ID"
  value       = aws_autoscaling_group.this.id
}

output "arn" {
  description = "Auto Scaling Group ARN"
  value       = aws_autoscaling_group.this.arn
}