output "iam_policy_arn" {
  description = "ARN of the IAM policy"
  value       = module.iam_policy.arn
}

output "iam_policy_id" {
  description = "Policy ID of the IAM policy"
  value       = module.iam_policy.policy_id
}