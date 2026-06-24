variable "name" {
  description = "Name of the Athena workgroup"
  type        = string
}

variable "description" {
  description = "Description of the workgroup"
  type        = string
  default     = ""
}

variable "enforce_workgroup_configuration" {
  description = "Whether to enforce the workgroup configuration on clients"
  type        = bool
  default     = true
}

variable "publish_cloudwatch_metrics" {
  description = "Whether to publish CloudWatch metrics for the workgroup"
  type        = bool
  default     = true
}

variable "requester_pays_enabled" {
  description = "Whether requester pays is enabled for the workgroup"
  type        = bool
  default     = false
}

variable "selected_engine_version" {
  description = "The engine version for Athena queries"
  type        = string
  default     = "AUTO"
}

variable "tags" {
  description = "Tags to apply to the workgroup"
  type        = map(string)
  default     = {}
}
