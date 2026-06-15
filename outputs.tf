output "cloudformation_stack_id" {
  description = "A unique identifier of the CloudFormation stack"
  value       = module.cloudformation_stack.stack_id
}

output "athena_workgroup_id" {
  description = "The ID of the Athena workgroup"
  value       = module.athena_workgroup.workgroup_id
}

output "athena_workgroup_arn" {
  description = "The ARN of the Athena workgroup"
  value       = module.athena_workgroup.workgroup_arn
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.internet_gateway.internet_gateway_id
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway"
  value       = module.internet_gateway.internet_gateway_arn
}