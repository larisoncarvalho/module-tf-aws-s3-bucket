resource "google_project_iam_audit_config" "this" {
  project = var.project
  service = var.service

  dynamic "audit_log_config" {
    for_each = var.audit_log_configs
    content {
      log_type = audit_log_config.value.log_type
    }
  }
}