variable "role_definition_id" {
  type        = string
  description = "The unique UUID/GUID identifying this role definition."
}

variable "name" {
  type        = string
  description = "The name of the Role Definition."
}

variable "scope" {
  type        = string
  description = "The scope at which the Role Definition applies."
}

variable "description" {
  type        = string
  description = "A description of the Role Definition."
}

variable "assignable_scopes" {
  type        = list(string)
  description = "One or more assignable scopes for this Role Definition."
}

variable "permissions_actions" {
  type        = list(string)
  description = "Allowed actions for the permissions block."
}

variable "permissions_data_actions" {
  type        = list(string)
  description = "Allowed data actions for the permissions block."
}