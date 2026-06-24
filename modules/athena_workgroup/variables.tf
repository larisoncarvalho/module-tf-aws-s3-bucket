variable "name" {
  description = "Name of the Athena workgroup."
  type        = string
}

variable "description" {
  description = "Description of the Athena workgroup."
  type        = string
  default     = ""
}

variable "state" {
  description = "State of the Athena workgroup (ENABLED or DISABLED)."
  type        = string
  default     = "ENABLED"
}

variable "enforce_workgroup_configuration" {
  description = "Whether to enforce workgroup configuration for all queries."
  type        = bool
  default     = true
}

variable "publish_cloudwatch_metrics_enabled" {
  description = "Whether CloudWatch metrics are published for the workgroup."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the Athena workgroup."
  type        = map(string)
  default     = {}
}
