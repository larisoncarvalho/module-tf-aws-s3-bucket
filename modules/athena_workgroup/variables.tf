variable "name" {
  description = "Name of the Athena workgroup"
  type        = string
}

variable "description" {
  description = "Description of the workgroup"
  type        = string
  default     = ""
}

variable "state" {
  description = "State of the workgroup (ENABLED or DISABLED)"
  type        = string
  default     = "ENABLED"
}

variable "enforce_workgroup_configuration" {
  description = "Whether to enforce workgroup configuration for all queries"
  type        = bool
  default     = true
}

variable "publish_cloudwatch_metrics_enabled" {
  description = "Whether to publish CloudWatch metrics for the workgroup"
  type        = bool
  default     = true
}

variable "requester_pays_enabled" {
  description = "Whether requester pays for cross-account query access"
  type        = bool
  default     = false
}

variable "selected_engine_version" {
  description = "Athena engine version selected for the workgroup"
  type        = string
  default     = "AUTO"
}

variable "tags" {
  description = "Tags to assign to the workgroup"
  type        = map(string)
  default     = {}
}