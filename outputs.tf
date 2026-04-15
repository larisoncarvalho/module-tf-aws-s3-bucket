output "primary_workgroup_id" {
  value       = module.primary_workgroup.workgroup_id
  description = "ID of the primary Athena workgroup"
}

output "primary_workgroup_arn" {
  value       = module.primary_workgroup.workgroup_arn
  description = "ARN of the primary Athena workgroup"
}