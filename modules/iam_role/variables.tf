variable "name" {
  type        = string
  description = "Name of the IAM role"
}

variable "path" {
  type        = string
  description = "Path for the IAM role"
}

variable "description" {
  type        = string
  description = "Description of the IAM role"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}

variable "assume_role_policy_document" {
  type = object({
    Version = string
    Statement = list(object({
      Effect = string
      Principal = object({
        Service = string
      })
      Action = string
    }))
  })
  description = "Assume role policy document"
}

variable "attached_policy_arns" {
  type        = map(string)
  description = "Map of policy ARNs to attach to the role"
  default     = {}
}