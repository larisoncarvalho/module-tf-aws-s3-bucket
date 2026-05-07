variable "role_definition_id" {
  type        = string
  description = "The unique identifier for the role definition"
}

variable "role_name" {
  type        = string
  description = "The name of the role definition"
}

variable "scope" {
  type        = string
  description = "The scope at which the role definition applies"
}

variable "description" {
  type        = string
  description = "The description of the role definition"
}

variable "actions" {
  type        = list(string)
  description = "The list of allowed actions for the role"
}

variable "assignable_scopes" {
  type        = list(string)
  description = "The list of scopes where the role can be assigned"
}