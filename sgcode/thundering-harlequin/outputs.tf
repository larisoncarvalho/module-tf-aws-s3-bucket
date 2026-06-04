output "athena_workgroup_arn" {
  description = "ARN of the Athena workgroup"
  value       = module.athena_workgroup.arn
}

output "athena_workgroup_id" {
  description = "ID of the Athena workgroup"
  value       = module.athena_workgroup.id
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = module.iam_role.arn
}

output "iam_role_id" {
  description = "ID of the IAM role"
  value       = module.iam_role.id
}

output "iam_role_name" {
  description = "Name of the IAM role"
  value       = module.iam_role.name
}