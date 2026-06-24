output "id" {
  description = "The ARN of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.id
}

output "outputs" {
  description = "The outputs of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.outputs
}
