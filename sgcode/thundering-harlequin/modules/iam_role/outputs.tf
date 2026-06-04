output "arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.this.arn
}

output "id" {
  description = "ID (name) of the IAM role"
  value       = aws_iam_role.this.id
}

output "name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.this.name
}