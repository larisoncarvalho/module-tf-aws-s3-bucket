output "stack_id" {
  description = "A unique identifier of the stack"
  value       = module.cloudformation_stack.stack_id
}

output "stack_outputs" {
  description = "A map of outputs from the stack"
  value       = module.cloudformation_stack.stack_outputs
}