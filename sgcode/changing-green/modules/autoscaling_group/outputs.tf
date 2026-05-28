output "asg_arn" {
  description = "ARN of the Auto Scaling group"
  value       = aws_autoscaling_group.this.arn
}

output "asg_name" {
  description = "Name of the Auto Scaling group"
  value       = aws_autoscaling_group.this.name
}