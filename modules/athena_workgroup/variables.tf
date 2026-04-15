variable "name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "description" {
  type        = string
  description = "Description of the workgroup"
}

variable "state" {
  type        = string
  description = "State of the workgroup"
}

variable "bytes_scanned_cutoff_per_query" {
  type        = number
  description = "Maximum bytes scanned per query"
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
  description = "Athena engine version"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}