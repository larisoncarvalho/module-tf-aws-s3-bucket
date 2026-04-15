output "workgroup_id" {
  value       = aws_athena_workgroup.this.id
  description = "ID of the Athena workgroup"
}

output "workgroup_arn" {
  value       = aws_athena_workgroup.this.arn
  description = "ARN of the Athena workgroup"
}