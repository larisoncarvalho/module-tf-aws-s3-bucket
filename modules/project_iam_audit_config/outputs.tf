output "service" {
  description = "The service the audit config applies to"
  value       = google_project_iam_audit_config.this.service
}