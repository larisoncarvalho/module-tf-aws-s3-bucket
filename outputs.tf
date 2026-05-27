output "cloudformation_stack_name" {
  description = "Name of the CloudFormation stack"
  value       = module.cloudformation_stack.stack_name
}

output "cloudformation_stack_id" {
  description = "Unique identifier of the CloudFormation stack"
  value       = module.cloudformation_stack.stack_id
}

output "athena_workgroup_name" {
  description = "Name of the Athena workgroup"
  value       = module.athena_workgroup.workgroup_name
}

output "athena_workgroup_arn" {
  description = "ARN of the Athena workgroup"
  value       = module.athena_workgroup.workgroup_arn
}