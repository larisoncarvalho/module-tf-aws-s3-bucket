variable "region" {
  type        = string
  description = "AWS region (global for IAM resources)"
}

variable "roles" {
  type = map(object({
    name                        = string
    path                        = string
    assume_role_policy_document = any
    max_session_duration        = number
    attached_policy_arns        = optional(any, [])
  }))
  description = "Map of IAM roles to create with their configurations"
}