output "stack_id" {
  description = "The unique identifier of the CloudFormation stack"
  value       = module.cloudformation_stack.stack_id
}

output "stack_outputs" {
  description = "A map of outputs from the CloudFormation stack"
  value       = module.cloudformation_stack.stack_outputs
}