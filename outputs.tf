output "role_name" {
  description = "Name of the IAM role"
  value       = module.neha_private_runner_autoscale_lambda_role.role_name
}

output "role_arn" {
  description = "ARN of the IAM role"
  value       = module.neha_private_runner_autoscale_lambda_role.role_arn
}