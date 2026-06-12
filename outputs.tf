output "cloudformation_stack_id" {
  description = "The unique identifier of the CloudFormation stack"
  value       = module.cloudformation_stack.stack_id
}

output "cloudformation_stack_name" {
  description = "The name of the CloudFormation stack"
  value       = module.cloudformation_stack.stack_name
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.internet_gateway.internet_gateway_id
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway"
  value       = module.internet_gateway.internet_gateway_arn
}