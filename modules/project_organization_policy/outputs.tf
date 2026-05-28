output "etag" {
  description = "The etag of the organization policy"
  value       = google_project_organization_policy.this.etag
}