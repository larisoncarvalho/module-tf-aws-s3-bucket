output "id" {
  description = "The name of the Athena workgroup (used as ID)."
  value       = aws_athena_workgroup.this.id
}

output "name" {
  description = "The name of the Athena workgroup."
  value       = aws_athena_workgroup.this.name
}
