output "id" {
  value       = aws_autoscaling_group.this.id
  description = "ID of the Auto Scaling Group"
}

output "arn" {
  value       = aws_autoscaling_group.this.arn
  description = "ARN of the Auto Scaling Group"
}

output "name" {
  value       = aws_autoscaling_group.this.name
  description = "Name of the Auto Scaling Group"
}