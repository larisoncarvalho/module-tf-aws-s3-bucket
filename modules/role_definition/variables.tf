variable "role_name" {
  description = "Name of the role definition"
  type        = string
}

variable "description" {
  description = "Description of what the role allows"
  type        = string
}

variable "scope" {
  description = "Scope at which the role definition is created"
  type        = string
}

variable "actions" {
  description = "List of allowed actions for this role"
  type        = list(string)
}

variable "assignable_scopes" {
  description = "List of scopes where this role can be assigned"
  type        = list(string)
}