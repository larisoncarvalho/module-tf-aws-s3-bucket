variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "618c8e34-b87b-44e8-bb3a-b2de95df60ed"
}

variable "policy_assignments" {
  description = "Map of subscription policy assignments"
  type = map(object({
    name                 = string
    subscription_id      = string
    policy_definition_id = string
    description          = optional(string, "")
    display_name         = optional(string, "")
    enforce              = optional(bool, true)
    not_scopes           = optional(list(string), [])
    parameters           = optional(string, null)
  }))
  default = {}
}

variable "role_assignments" {
  description = "Map of role assignments"
  type = map(object({
    scope              = string
    role_definition_id = string
    principal_id       = string
    principal_type     = optional(string, null)
    name               = optional(string, null)
  }))
  default = {}
}
