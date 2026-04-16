variable "region" {
  type        = string
  description = "AWS region"
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
  description = "JSON-encoded policy document granting an entity permission to assume the role"
}

variable "iam_role_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds for the IAM role"
}

variable "iam_role_attached_policy_arns" {
  type        = map(object({ arn = optional(any, {}) }))
  description = "Map of managed policy ARNs to attach to the IAM role"
  default     = {}
}