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

variable "assume_role_policy" {
  type        = string
  description = "JSON-encoded policy document granting an entity permission to assume the role"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds for the IAM role"
}

variable "attached_policy_arns" {
  type        = map(object({ arn = string }))
  description = "Map of managed policy ARNs to attach to the IAM role"
  default     = {}
}