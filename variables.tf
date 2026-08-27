variable "role_assignments" {
  description = "Map of Azure role assignments to manage"
  type = map(object({
    scope              = string
    role_definition_id = string
    principal_id       = string
    principal_type     = optional(string, null)
    name               = optional(string, null)
  }))
  default = {}
}
