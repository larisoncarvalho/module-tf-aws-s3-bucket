# Module input variables for a single IAM role instance

# The name of the IAM role
variable "name" {
  description = "The name of the IAM role."
  type        = string
}

# The path under which the role is created
variable "path" {
  description = "Path for the IAM role."
  type        = string
  default     = "/"
}

# Optional description for the IAM role
variable "description" {
  description = "Optional description for the IAM role."
  type        = string
  default     = null
}

# Maximum session duration in seconds (between 3600 and 43200)
variable "max_session_duration" {
  description = "Maximum session duration in seconds."
  type        = number
  default     = 3600
}

# JSON-encoded assume role trust policy document
variable "assume_role_policy" {
  description = "JSON-encoded IAM assume role (trust) policy document."
  type        = string
}

# List of managed policy ARNs to attach to this role
variable "attached_policy_arns" {
  description = "List of managed policy ARNs to attach to the role."
  type        = list(string)
  default     = []
}

# Resource tags to apply to the IAM role
variable "tags" {
  description = "Tags to apply to the IAM role."
  type        = map(string)
  default     = {}
}
