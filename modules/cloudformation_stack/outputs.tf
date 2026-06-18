output "id" {
  description = "Unique identifier of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.id
}

output "outputs" {
  description = "Map of outputs from the CloudFormation stack"
  value       = aws_cloudformation_stack.this.outputs
}