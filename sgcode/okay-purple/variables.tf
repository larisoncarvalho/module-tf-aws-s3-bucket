variable "region" {
  type        = string
  description = "AWS region"
}

variable "name" {
  type        = string
  description = "Friendly name of the IAM role"
}

variable "path" {
  type        = string
  description = "Path to the IAM role"
}

variable "description" {
  type        = string
  description = "Description of the IAM role"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}

variable "assume_role_policy" {
  type        = string
  description = "JSON-encoded assume role policy document"
}

variable "attached_policy_arns" {
  type        = set(string)
  description = "Set of managed policy ARNs to attach to the IAM role"
}