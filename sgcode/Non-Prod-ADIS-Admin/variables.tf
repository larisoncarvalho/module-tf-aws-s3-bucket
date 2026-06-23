# Root input variables — forwarded to the iam_role module

variable "iam_roles" {
  description = "Map of IAM role instances to manage, keyed by a stable snake_case identifier."
  type = map(object({
    name                 = string
    path                 = optional(string, "/")
    assume_role_policy   = string
    max_session_duration = optional(number, 3600)
    attached_policy_arns = optional(list(string), [])
    tags                 = optional(map(string), {})
  }))
  default = {}
}
