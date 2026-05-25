output "etag" {
  description = "The etag of the project IAM policy"
  value       = google_project_iam_policy.this.etag
}

output "policy_data" {
  description = "The policy data of the project IAM policy"
  value       = google_project_iam_policy.this.policy_data
}