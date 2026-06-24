output "id" {
  description = "The ARN of the CloudFormation stack."
  value       = aws_cloudformation_stack.this.id
}

output "name" {
  description = "The name of the CloudFormation stack."
  value       = aws_cloudformation_stack.this.name
}
