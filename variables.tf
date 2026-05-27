variable "region" {
  description = "The region for the stack"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "policy_data" {
  description = "The IAM policy data (JSON) containing all role bindings"
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
  description = "The organization policy constraint identifier"
  type        = string
}

variable "service_account_keys" {
  description = "Map of service account keys to manage"
  type = map(object({
    service_account_id = string
    key_algorithm      = string
  }))
  default = {}
}