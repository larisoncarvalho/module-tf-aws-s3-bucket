variable "region" {
  description = "The region for the stack"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "policy_data" {
  description = "The policy data JSON string containing all IAM bindings"
  type        = string
}

variable "audit_config_service" {
  description = "The service for which audit logging is configured"
  type        = string
}

variable "audit_log_configs" {
  description = "List of audit log config blocks specifying log types"
  type        = list(object({ log_type = string }))
}

variable "org_policy_constraint" {
  description = "The constraint identifier for the organization policy"
  type        = string
}

variable "service_account_keys" {
  description = "Map of service account keys to manage"
  type = map(object({
    service_account_id = string
    key_algorithm      = string
  }))
}