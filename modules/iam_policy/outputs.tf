output "arn" {
  description = "ARN assigned by AWS to this policy"
  value       = aws_iam_policy.this.arn
}

output "policy_id" {
  description = "Policy's ID"
  value       = aws_iam_policy.this.policy_id
}