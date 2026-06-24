# Outputs exposed by the iam_role module

# The name of the created IAM role
output "name" {
  description = "The name of the IAM role."
  value       = aws_iam_role.this.name
}

# The ARN of the created IAM role
output "arn" {
  description = "The ARN of the IAM role."
  value       = aws_iam_role.this.arn
}

# The unique role ID assigned by AWS
output "role_id" {
  description = "The unique ID of the IAM role."
  value       = aws_iam_role.this.unique_id
}
