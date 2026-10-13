variable "scope" {
  description = "The scope at which the role definition applies"
  type        = string
}

variable "role_name" {
  description = "The name of the role definition"
  type        = string
}

variable "description" {
  description = "A description of the role definition"
  type        = string
  default     = ""
}

variable "assignable_scopes" {
  description = "List of assignable scopes for the role"
  type        = list(string)
  default     = ["/"]
}

variable "permissions" {
  description = "List of permission blocks"
  type = list(object({
    actions          = optional(list(string), [])
    not_actions      = optional(list(string), [])
    data_actions     = optional(list(string), [])
    not_data_actions = optional(list(string), [])
  }))
  default = []
}
