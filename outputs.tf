output "asg_id" {
  value       = module.runner_asg.id
  description = "ID of the Auto Scaling Group"
}

output "asg_arn" {
  value       = module.runner_asg.arn
  description = "ARN of the Auto Scaling Group"
}

output "asg_name" {
  value       = module.runner_asg.name
  description = "Name of the Auto Scaling Group"
}