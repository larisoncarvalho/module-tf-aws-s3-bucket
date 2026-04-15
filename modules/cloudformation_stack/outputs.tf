output "stack_id" {
  value       = aws_cloudformation_stack.this.id
  description = "ID of the CloudFormation stack"
}

output "stack_name" {
  value       = aws_cloudformation_stack.this.name
  description = "Name of the CloudFormation stack"
}