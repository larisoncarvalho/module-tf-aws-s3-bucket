output "id" {
  description = "The name of the Athena workgroup"
  value       = aws_athena_workgroup.this.id
}

output "arn" {
  description = "The ARN of the Athena workgroup"
  value       = aws_athena_workgroup.this.arn
}
