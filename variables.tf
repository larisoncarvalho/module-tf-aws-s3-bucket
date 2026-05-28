variable "region" {
  type        = string
  description = "AWS region"
}

variable "athena_workgroup_name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "athena_workgroup_state" {
  type        = string
  description = "State of the workgroup. Valid values are DISABLED or ENABLED"
}

variable "athena_workgroup_enforce_workgroup_configuration" {
  type        = bool
  description = "Boolean whether the settings for the workgroup override client-side settings"
}

variable "athena_workgroup_publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Boolean whether Amazon CloudWatch metrics are enabled for the workgroup"
}

variable "athena_workgroup_requester_pays_enabled" {
  type        = bool
  description = "Whether members can reference Amazon S3 Requester Pays buckets in queries"
}

variable "athena_workgroup_selected_engine_version" {
  type        = string
  description = "Requested engine version for the workgroup"
}