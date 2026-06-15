output "stack_id" {
  description = "A unique identifier of the stack"
  value       = aws_cloudformation_stack.this.id
}