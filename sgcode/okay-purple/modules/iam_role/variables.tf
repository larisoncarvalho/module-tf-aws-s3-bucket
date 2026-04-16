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

variable "assume_role_policy" {
  description = "Policy document granting an entity permission to assume the role (JSON string)"
  type        = string
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds for the IAM role"
  type        = number
}

variable "policy_arns" {
  description = "Map of policy ARNs to attach to the IAM role"
  type        = map(string)
  default     = {}
}