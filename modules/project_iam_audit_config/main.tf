resource "google_project_iam_audit_config" "this" {
  project = var.project
  service = var.service

  audit_log_config {
    log_type = var.audit_log_config_admin_read
  }

  audit_log_config {
    log_type = var.audit_log_config_data_read
  }

  audit_log_config {
    log_type = var.audit_log_config_data_write
  }
}