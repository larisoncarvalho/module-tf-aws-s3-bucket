output "autoscaling_group_id" {
  description = "ID of the auto-scaling group"
  value       = aws_autoscaling_group.runner.id
}

output "autoscaling_group_name" {
  description = "Name of the auto-scaling group"
  value       = aws_autoscaling_group.runner.name
}