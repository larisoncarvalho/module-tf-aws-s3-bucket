variable "region" {
  type        = string
  description = "AWS region to deploy resources"
}

variable "iam_roles" {
  type = map(object({
    name                  = string
    path                  = string
    assume_role_policy    = string
    max_session_duration  = number
    force_detach_policies = bool
    managed_policy_arns   = optional(list(string), [])
    inline_policy = optional(list(object({
      name   = string
      policy = string
    })), [])
  }))
  description = "Map of IAM roles to create"
}