variable "name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "description" {
  type        = string
  description = "Description of the Athena workgroup"
}

variable "state" {
  type        = string
  description = "State of the workgroup (ENABLED or DISABLED)"
}

variable "bytes_scanned_cutoff_per_query" {
  type        = number
  description = "Maximum bytes scanned per query before cancellation"
}

variable "enforce_workgroup_configuration" {
  type        = bool
  description = "Whether to enforce workgroup configuration over client-side settings"
}

variable "publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether to publish CloudWatch metrics for the workgroup"
}

variable "requester_pays_enabled" {
  type        = bool
  description = "Whether requester pays for cross-account data access"
}

variable "selected_engine_version" {
  type        = string
  description = "Athena engine version selected for the workgroup"
}

variable "output_location" {
  type        = string
  description = "S3 URI for query result output location"
}

variable "encryption_option" {
  type        = string
  description = "Encryption option for query results (e.g. SSE_S3, SSE_KMS, CSE_KMS)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the Athena workgroup"
}