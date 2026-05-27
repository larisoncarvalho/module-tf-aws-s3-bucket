variable "region" {
  description = "The GCP region for the provider"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "policy_data" {
  description = "The IAM policy data JSON"
  type        = string
}

variable "audit_config_service" {
  description = "The service to apply audit logging for"
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
  description = "The constraint identifier for the organization policy"
  type        = string
}

variable "service_account_keys" {
  description = "Map of service account keys to manage, keyed by logical name"
  type        = map(object({ service_account_id = string, key_algorithm = string }))
}