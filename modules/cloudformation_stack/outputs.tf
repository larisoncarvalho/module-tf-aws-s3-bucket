output "stack_id" {
  description = "ID of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.id
}

output "stack_outputs" {
  description = "Outputs from the CloudFormation stack"
  value       = aws_cloudformation_stack.this.outputs
}