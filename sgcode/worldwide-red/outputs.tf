output "stack_id" {
  description = "A unique identifier of the CloudFormation stack"
  value       = module.cloudformation_stack.stack_id
}