variable "region" {
  description = "AWS region"
  type        = string
}

variable "name" {
  description = "Friendly name of the IAM role"
  type        = string
}

variable "path" {
  description = "Path to the IAM role"
  type        = string
}

variable "description" {
  description = "Description of the IAM role"
  type        = string
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds for the IAM role"
  type        = number
}

variable "assume_role_policy" {
  description = "JSON policy document granting an entity permission to assume the role"
  type        = string
}

variable "attached_policy_arns" {
  description = "Map of managed policy ARNs to attach to the IAM role"
  type        = map(object({ arn = string }))
  default     = {}
}