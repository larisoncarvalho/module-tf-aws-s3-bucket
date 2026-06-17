output "workgroup_id" {
  value       = module.primary_workgroup.workgroup_id
  description = "ID of the Athena workgroup"
}

output "workgroup_arn" {
  value       = module.primary_workgroup.workgroup_arn
  description = "ARN of the Athena workgroup"
}

output "workgroup_name" {
  value       = module.primary_workgroup.workgroup_name
  description = "Name of the Athena workgroup"
}