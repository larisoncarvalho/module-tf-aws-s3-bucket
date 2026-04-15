variable "name" {
  type        = string
  description = "Name of the IAM role"
}

variable "path" {
  type        = string
  description = "Path for the IAM role"
}

variable "assume_role_policy_document" {
  type        = any
  description = "Assume role policy document structure"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}

variable "attached_policy_arns" {
  type        = set(string)
  description = "Set of policy ARNs to attach to the role"
  default     = []
}