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
  description = "Policy document granting permission to assume the role (JSON string)"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}