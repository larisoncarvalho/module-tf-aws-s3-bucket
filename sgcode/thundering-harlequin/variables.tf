variable "region" {
  type        = string
  description = "AWS region where resources will be managed"
}

variable "athena_workgroup_name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "athena_workgroup_state" {
  type        = string
  description = "State of the Athena workgroup (ENABLED or DISABLED)"
}

variable "athena_workgroup_enforce_workgroup_configuration" {
  type        = bool
  description = "Whether workgroup settings override client-side settings"
}

variable "athena_workgroup_publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether Amazon CloudWatch metrics are enabled for the workgroup"
}

variable "athena_workgroup_requester_pays_enabled" {
  type        = bool
  description = "Whether members can reference Amazon S3 Requester Pays buckets in queries"
}

variable "athena_workgroup_selected_engine_version" {
  type        = string
  description = "Requested Athena engine version"
}

variable "iam_role_name" {
  type        = string
  description = "Friendly name of the IAM role"
}

variable "iam_role_path" {
  type        = string
  description = "Path to the IAM role"
}

variable "iam_role_description" {
  type        = string
  description = "Description of the IAM role"
}

variable "iam_role_assume_role_policy" {
  type        = string
  description = "Policy document granting permission to assume the role (JSON string)"
}

variable "iam_role_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}