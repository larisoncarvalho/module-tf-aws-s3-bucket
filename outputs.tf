output "launch_template_id" {
  description = "ID of the launch template"
  value       = module.launch_template.id
}

output "autoscaling_group_id" {
  description = "ID of the auto scaling group"
  value       = module.autoscaling_group.id
}

output "autoscaling_group_arn" {
  description = "ARN of the auto scaling group"
  value       = module.autoscaling_group.arn
}