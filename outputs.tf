output "athena_workgroup_name" {
  description = "Name of the Athena workgroup"
  value       = module.athena_workgroup.workgroup_name
}

output "athena_workgroup_arn" {
  description = "ARN of the Athena workgroup"
  value       = module.athena_workgroup.workgroup_arn
}