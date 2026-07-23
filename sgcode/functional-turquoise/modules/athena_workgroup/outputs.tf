output "workgroup_ids" {
  description = "IDs of the Athena workgroups"
  value       = { for k, v in aws_athena_workgroup.this : k => v.id }
}

output "workgroup_arns" {
  description = "ARNs of the Athena workgroups"
  value       = { for k, v in aws_athena_workgroup.this : k => v.arn }
}