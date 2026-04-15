output "id" {
  value       = aws_athena_workgroup.this.id
  description = "ID of the Athena workgroup"
}

output "name" {
  value       = aws_athena_workgroup.this.name
  description = "Name of the Athena workgroup"
}

output "arn" {
  value       = aws_athena_workgroup.this.arn
  description = "ARN of the Athena workgroup"
}