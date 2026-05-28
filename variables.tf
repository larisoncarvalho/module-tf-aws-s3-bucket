variable "region" {
  description = "The GCP region for the provider"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "policy_data" {
  description = "The IAM policy data (JSON) containing all bindings"
  type        = string
}

variable "audit_config_service" {
  description = "The service for which audit logging is configured"
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

variable "org_policy_constraint" {
  description = "The organization policy constraint name"
  type        = string
}

variable "service_account_keys" {
  description = "Map of service account key instances, each containing a map of keys to manage"
  type = map(object({
    service_account_id = string
  }))
}