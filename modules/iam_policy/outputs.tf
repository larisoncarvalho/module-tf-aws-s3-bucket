output "policy_arns" {
  description = "ARNs of created IAM policies"
  value       = { for k, v in aws_iam_policy.this : k => v.arn }
}

output "policy_ids" {
  description = "IDs of created IAM policies"
  value       = { for k, v in aws_iam_policy.this : k => v.id }
}