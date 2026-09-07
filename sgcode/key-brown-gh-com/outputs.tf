output "log_group_arn" {
  description = "ARN of the CloudWatch Log Group"
  value       = module.cloudwatch_log_group.arn
}

output "log_group_name" {
  description = "Name of the CloudWatch Log Group"
  value       = module.cloudwatch_log_group.name
}