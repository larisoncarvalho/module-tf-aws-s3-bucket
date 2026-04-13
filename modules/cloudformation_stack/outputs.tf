output "stack_id" {
  description = "The ID of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.id
}

output "stack_name" {
  description = "The name of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.name
}

output "outputs" {
  description = "The outputs of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.outputs
}