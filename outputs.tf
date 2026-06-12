output "primary_workgroup_name" {
  description = "Name of the primary Athena workgroup"
  value       = module.primary_workgroup.workgroup_name
}

output "primary_workgroup_arn" {
  description = "ARN of the primary Athena workgroup"
  value       = module.primary_workgroup.workgroup_arn
}

output "stulyze_app_stack_id" {
  description = "ID of the stulyze-app CloudFormation stack"
  value       = module.stulyze_app_stack.stack_id
}

output "stulyze_app_stack_outputs" {
  description = "Outputs from the stulyze-app CloudFormation stack"
  value       = module.stulyze_app_stack.stack_outputs
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.igw_02aec4b4978ee2879.internet_gateway_id
}

output "internet_gateway_arn" {
  description = "ARN of the Internet Gateway"
  value       = module.igw_02aec4b4978ee2879.internet_gateway_arn
}