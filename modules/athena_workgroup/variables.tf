variable "workgroup_name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "description" {
  type        = string
  description = "Description of the workgroup purpose"
}

variable "state" {
  type        = string
  description = "State of the workgroup (ENABLED or DISABLED)"
}

variable "bytes_scanned_cutoff_per_query" {
  type        = number
  description = "Maximum bytes scanned per query before cutoff"
}

variable "enforce_workgroup_configuration" {
  type        = bool
  description = "Whether to enforce workgroup configuration settings"
}

variable "publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether to publish CloudWatch metrics"
}

variable "requester_pays_enabled" {
  type        = bool
  description = "Whether requester pays for S3 data access"
}

variable "output_location" {
  type        = string
  description = "S3 location for query results"
}

variable "encryption_option" {
  type        = string
  description = "Encryption option for query results"
}

variable "selected_engine_version" {
  type        = string
  description = "Athena engine version selection"
}