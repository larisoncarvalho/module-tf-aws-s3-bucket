output "workgroup_id" {
  value       = aws_athena_workgroup.this.id
  description = "ID of the Athena workgroup"
}