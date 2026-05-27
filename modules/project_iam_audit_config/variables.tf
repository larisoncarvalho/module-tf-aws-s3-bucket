variable "project" {
  description = "The GCP project ID to apply the audit config to"
  type        = string
}

variable "service" {
  description = "The service for which audit logging is configured"
  type        = string
}

variable "audit_log_configs" {
  description = "List of audit log config blocks specifying log types"
  type        = list(object({ log_type = string }))
  default     = []
}