output "role_names" {
  value       = { for k, v in module.iam_role : k => v.role_name }
  description = "Map of role keys to role names"
}

output "role_arns" {
  value       = { for k, v in module.iam_role : k => v.role_arn }
  description = "Map of role keys to role ARNs"
}