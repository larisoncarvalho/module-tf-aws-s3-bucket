output "role_arn" {
  description = "ARN of the IAM role."
  value       = module.iam_role.role_arn
}

output "role_name" {
  description = "Name of the IAM role."
  value       = module.iam_role.role_name
}