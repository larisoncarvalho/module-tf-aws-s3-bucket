variable "name" {
  type        = string
  description = "Friendly name of the IAM role"
}

variable "path" {
  type        = string
  description = "Path to the IAM role"
}

variable "assume_role_policy" {
  type        = string
  description = "Policy document granting an entity permission to assume the role (JSON string)"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds (3600 to 43200)"
}

variable "force_detach_policies" {
  type        = bool
  description = "Whether to force detaching any policies before destroying the role"
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "Set of managed policy ARNs to attach to the role"
  default     = []
}

variable "inline_policy" {
  type = list(object({
    name   = string
    policy = string
  }))
  description = "List of inline policy blocks to attach to the role"
  default     = []
}