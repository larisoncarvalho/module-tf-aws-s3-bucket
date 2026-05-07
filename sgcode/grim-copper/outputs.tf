output "arn" {
  description = "ARN assigned by AWS to this policy"
  value       = module.iam_policy.arn
}

output "policy_id" {
  description = "Policy's ID"
  value       = module.iam_policy.policy_id
}