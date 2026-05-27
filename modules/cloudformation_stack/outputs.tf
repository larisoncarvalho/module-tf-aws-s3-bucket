output "stack_name" {
  description = "Name of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.name
}

output "stack_id" {
  description = "Unique identifier of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.id
}