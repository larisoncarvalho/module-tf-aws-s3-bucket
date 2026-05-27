variable "project" {
  description = "The GCP project ID to apply the audit config to"
  type        = string
}

variable "service" {
  description = "The service to apply audit logging for (e.g. allServices)"
  type        = string
}

variable "audit_log_config_admin_read" {
  description = "Log type for admin read audit logs"
  type        = string
}

variable "audit_log_config_data_read" {
  description = "Log type for data read audit logs"
  type        = string
}

variable "audit_log_config_data_write" {
  description = "Log type for data write audit logs"
  type        = string
}