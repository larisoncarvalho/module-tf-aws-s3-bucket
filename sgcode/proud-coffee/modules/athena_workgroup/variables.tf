variable "workgroup_name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "state" {
  type        = string
  description = "State of the workgroup"
}

variable "enforce_workgroup_configuration" {
  type        = bool
  description = "Whether to enforce workgroup configuration"
}

variable "publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether to publish CloudWatch metrics"
}

variable "requester_pays_enabled" {
  type        = bool
  description = "Whether requester pays is enabled"
}