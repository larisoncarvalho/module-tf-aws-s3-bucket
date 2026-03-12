variable "role_name" {
  description = "The name of the role definition"
  type        = string
}

variable "scope" {
  description = "The scope at which the role definition applies"
  type        = string
}

variable "description" {
  description = "Description of the role definition"
  type        = string
}

variable "actions" {
  description = "List of allowed actions for the role"
  type        = list(string)
}

variable "assignable_scopes" {
  description = "List of scopes where the role can be assigned"
  type        = list(string)
}