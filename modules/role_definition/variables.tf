variable "role_name" {
  type        = string
  description = "Display name of the role definition"
}

variable "assignable_scope" {
  type        = string
  description = "Primary scope where this role can be assigned"
}

variable "description" {
  type        = string
  description = "Description of the role's purpose and permissions"
}

variable "actions" {
  type        = list(string)
  description = "Management plane actions allowed by this role"
}

variable "data_actions" {
  type        = list(string)
  description = "Data plane actions allowed by this role"
}

variable "not_actions" {
  type        = list(string)
  description = "Management plane actions explicitly denied"
}

variable "not_data_actions" {
  type        = list(string)
  description = "Data plane actions explicitly denied"
}