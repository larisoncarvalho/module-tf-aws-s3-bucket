# Root variable: map of IAM role instances keyed by sanitized role name
variable "iam_roles" {
  description = "Map of IAM role configurations keyed by a stable snake_case name."
  type = map(object({
    name                 = string
    path                 = optional(string, "/")
    description          = optional(string, null)
    max_session_duration = optional(number, 3600)
    assume_role_policy   = string
    attached_policy_arns = optional(list(string), [])
    tags                 = optional(map(string), {})
  }))
}
