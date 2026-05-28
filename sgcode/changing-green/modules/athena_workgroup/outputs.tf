output "workgroup_id" {
  description = "ID of the Athena workgroup"
  value       = aws_athena_workgroup.this.id
}