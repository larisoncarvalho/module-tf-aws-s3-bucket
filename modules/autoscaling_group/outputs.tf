output "id" {
  description = "Auto Scaling Group ID"
  value       = aws_autoscaling_group.this.id
}

output "name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.this.name
}