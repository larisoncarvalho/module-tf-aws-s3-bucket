output "workgroup_id" {
  description = "ID of the Athena workgroup"
  value       = aws_athena_workgroup.this.id
}

output "workgroup_arn" {
  description = "ARN of the Athena workgroup"
  value       = aws_athena_workgroup.this.arn
}