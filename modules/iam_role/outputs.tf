output "arn" {
  value       = aws_iam_role.this.arn
  description = "ARN of the IAM role"
}

output "name" {
  value       = aws_iam_role.this.name
  description = "Name of the IAM role"
}

output "id" {
  value       = aws_iam_role.this.id
  description = "ID of the IAM role"
}