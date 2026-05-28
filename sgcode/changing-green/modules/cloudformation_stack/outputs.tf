output "stack_ids" {
  description = "Map of CloudFormation stack IDs"
  value       = { for k, v in aws_cloudformation_stack.this : k => v.id }
}