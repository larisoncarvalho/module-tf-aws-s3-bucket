variable "scope" {
  description = "Scope at which the role assignment applies"
  type        = string
}

variable "role_definition_id" {
  description = "The full resource ID of the role definition"
  type        = string
}

variable "principal_id" {
  description = "The ID of the principal to assign the role to"
  type        = string
}

variable "principal_type" {
  description = "The type of principal (User, Group, ServicePrincipal)"
  type        = string
  default     = null
}

variable "name" {
  description = "A unique UUID/GUID for the role assignment"
  type        = string
  default     = null
}
