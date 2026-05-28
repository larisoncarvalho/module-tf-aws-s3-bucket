output "service" {
  description = "The service for which audit logging is configured"
  value       = google_project_iam_audit_config.this.service
}