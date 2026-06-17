variable "region" {
  description = "AWS region for the provider"
  type        = string
}

variable "iam_role_name" {
  description = "Friendly name of the IAM role"
  type        = string
}

variable "iam_role_path" {
  description = "Path to the IAM role"
  type        = string
}

variable "iam_role_description" {
  description = "Description of the IAM role"
  type        = string
}

variable "iam_role_assume_role_policy" {
  description = "Policy document granting an entity permission to assume the role (JSON string)"
  type        = string
}

variable "iam_role_max_session_duration" {
  description = "Maximum session duration in seconds for the IAM role"
  type        = number
}

variable "iam_role_policy_arns" {
  description = "Map of policy ARNs to attach to the IAM role"
  type        = map(string)
  default     = {}
}