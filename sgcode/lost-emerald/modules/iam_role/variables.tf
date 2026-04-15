variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "role_path" {
  description = "Path for the IAM role"
  type        = string
}

variable "assume_role_policy_document" {
  description = "Assume role policy document"
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
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds"
  type        = number
}

variable "attached_policies" {
  description = "Policies to attach to the role"
  type = map(object({
    policy_arn = string
  }))
  default = {}
}