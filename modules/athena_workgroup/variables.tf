variable "name" {
  description = "Name of the Athena workgroup"
  type        = string
}

variable "description" {
  description = "Description of the Athena workgroup"
  type        = string
  default     = ""
}

variable "enforce_workgroup_configuration" {
  description = "Whether to enforce the workgroup configuration"
  type        = bool
  default     = true
}

variable "publish_cloudwatch_metrics_enabled" {
  description = "Whether to publish CloudWatch metrics for queries in the workgroup"
  type        = bool
  default     = true
}

variable "requester_pays_enabled" {
  description = "Whether requester pays for cross-account queries"
  type        = bool
  default     = false
}

variable "bytes_scanned_cutoff_per_query" {
  description = "Integer for the upper data usage limit (cutoff) per query in bytes"
  type        = number
  default     = null
}

variable "output_location" {
  description = "S3 bucket URL output location for query results"
  type        = string
  default     = null
}

variable "encryption_option" {
  description = "Indicates whether Amazon S3 server-side encryption with Amazon S3-managed keys (SSE-S3), server-side encryption with KMS-managed keys (SSE-KMS), or client-side encryption with KMS-managed keys (CSE-KMS) is used"
  type        = string
  default     = null
}

variable "kms_key" {
  description = "For SSE-KMS and CSE-KMS, the KMS key ARN"
  type        = string
  default     = null
}

variable "selected_engine_version" {
  description = "The engine version requested by the user"
  type        = string
  default     = "AUTO"
}

variable "state" {
  description = "State of the workgroup (ENABLED or DISABLED)"
  type        = string
  default     = "ENABLED"
}

variable "tags" {
  description = "Tags to apply to the workgroup"
  type        = map(string)
  default     = {}
}
