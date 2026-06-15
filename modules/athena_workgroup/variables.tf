variable "name" {
  description = "Name of the Athena workgroup"
  type        = string
}

variable "state" {
  description = "State of the workgroup. Valid values are DISABLED or ENABLED"
  type        = string
}

variable "enforce_workgroup_configuration" {
  description = "Boolean whether the settings for the workgroup override client-side settings"
  type        = bool
}

variable "publish_cloudwatch_metrics_enabled" {
  description = "Boolean whether Amazon CloudWatch metrics are enabled for the workgroup"
  type        = bool
}

variable "requester_pays_enabled" {
  description = "If set to true, allows members to reference Amazon S3 Requester Pays buckets in queries"
  type        = bool
}

variable "selected_engine_version" {
  description = "Requested engine version"
  type        = string
}