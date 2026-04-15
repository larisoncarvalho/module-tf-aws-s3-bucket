variable "role_name" {
  type        = string
  description = "Name of the IAM role"
}

variable "path" {
  type        = string
  description = "Path for the IAM role"
}

variable "assume_role_policy_document" {
  type = object({
    Version = string
    Statement = list(object({
      Effect    = string
      Principal = map(any)
      Action    = string
    }))
  })
  description = "Trust policy document for the role"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}

variable "attached_policies" {
  type = map(object({
    policy_arn = string
  }))
  description = "Map of policy attachments for the role"
  default     = {}
}