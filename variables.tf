variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "role_definitions" {
  description = "Map of Azure role definitions to manage"
  type = map(object({
    role_name         = string
    scope             = optional(string, "")
    description       = optional(string, "")
    assignable_scopes = optional(list(string), ["/"])
    permissions = optional(list(object({
      actions          = optional(list(string), [])
      not_actions      = optional(list(string), [])
      data_actions     = optional(list(string), [])
      not_data_actions = optional(list(string), [])
    })), [])
  }))
  default = {}
}
