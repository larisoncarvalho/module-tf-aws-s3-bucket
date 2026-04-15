output "role_arn" {
  value       = module.neha_private_runner_role.role_arn
  description = "ARN of the IAM role"
}

output "role_name" {
  value       = module.neha_private_runner_role.role_name
  description = "Name of the IAM role"
}