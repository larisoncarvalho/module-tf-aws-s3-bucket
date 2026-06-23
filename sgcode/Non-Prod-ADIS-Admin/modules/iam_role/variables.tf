# VARIABLES FOR THE IAM_ROLE MODULE — ONE PER CONFIGURABLE ATTRIBUTE

variable "name" {
  description = "The name of the IAM role."
  type        = string
}

variable "path" {
  description = "The path to the IAM role."
  type        = string
  default     = "/"
}

variable "assume_role_policy" {
  description = "The trust relationship policy document (JSON string) for the role."
  type        = string
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds (3600–43200)."
  type        = number
  default     = 3600
}

variable "attached_policy_arns" {
  description = "List of managed policy ARNs to attach to the role."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the IAM role."
  type        = map(string)
  default     = {}
}