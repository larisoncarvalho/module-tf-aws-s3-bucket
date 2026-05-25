output "etag" {
  description = "The etag of the project IAM policy"
  value       = module.project_iam_policy.etag
}

output "policy_data" {
  description = "The policy data of the project IAM policy"
  value       = module.project_iam_policy.policy_data
}