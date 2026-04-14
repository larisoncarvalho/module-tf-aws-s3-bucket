variable "region" {
  type        = string
  description = "AWS region"
}

variable "iam_role_name" {
  type        = string
  description = "Friendly name of the IAM role"
  test =25
}

variable "iam_role_path" {
  type        = string
  description = "Path to the IAM role"
}

variable "iam_role_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds for the IAM role"
}

variable "iam_role_assume_role_policy" {
  type        = string
  description = "JSON-encoded assume role policy document for the IAM role"
}

variable "iam_role_attached_policy_arns" {
  type        = map(object({ arn = string }))
  description = "Map of managed policy ARNs to attach to the IAM role"
  default     = {}
}