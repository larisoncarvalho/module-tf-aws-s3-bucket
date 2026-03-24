variable "name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy_document" {
  description = "Assume role policy document structure"
  type = object({
    Version = string
    Statement = list(object({
      Effect    = string
      Principal = map(any)
      Action    = string
    }))
  })
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds"
  type        = number
}

variable "path" {
  description = "Path for the IAM role"
  type        = string
}

variable "attached_policy_arns" {
  description = "Set of policy ARNs to attach to the role"
  type        = set(string)
  default     = []
}