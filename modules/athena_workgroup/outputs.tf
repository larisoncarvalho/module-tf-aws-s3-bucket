output "id" {
  description = "The name of the workgroup (used as the ID)"
  value       = aws_athena_workgroup.this.id
}

output "arn" {
  description = "ARN of the workgroup"
  value       = aws_athena_workgroup.this.arn
}
