output "etag" {
  description = "The etag of the project IAM policy"
  value       = google_project_iam_policy.this.etag
}