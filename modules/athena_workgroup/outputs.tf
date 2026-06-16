output "workgroup_id" {
  description = "Workgroup name (used as ID)"
  value       = aws_athena_workgroup.this.id
}

output "workgroup_arn" {
  description = "ARN of the workgroup"
  value       = aws_athena_workgroup.this.arn
}