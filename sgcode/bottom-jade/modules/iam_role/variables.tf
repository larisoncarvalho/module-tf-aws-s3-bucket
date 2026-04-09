variable "role_name" {
  type        = string
  description = "Name of the IAM role"
}

variable "role_path" {
  type        = string
  description = "Path for the IAM role"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}

variable "assume_role_policy" {
  type        = object({})
  description = "Assume role policy document"
}

variable "policy_attachments" {
  type        = map(object({ policy_arn = string }))
  description = "Map of policy attachments for the role"
  default     = {}
}