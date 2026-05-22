output "autoscaling_group_id" {
  description = "ID of the Auto Scaling Group"
  value       = module.autoscaling_group.autoscaling_group_id
}

output "autoscaling_group_arn" {
  description = "ARN of the Auto Scaling Group"
  value       = module.autoscaling_group.autoscaling_group_arn
}

output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.autoscaling_group.autoscaling_group_name
}