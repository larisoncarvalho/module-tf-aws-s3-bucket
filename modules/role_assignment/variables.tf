variable "scope" {
  description = "The scope at which the role assignment applies"
  type        = string
}

variable "role_definition_id" {
  description = "The fully-qualified role definition ID"
  type        = string
}

variable "principal_id" {
  description = "The ID of the principal to assign the role to"
  type        = string
}

variable "principal_type" {
  description = "The type of principal: User, Group, or ServicePrincipal"
  type        = string
  default     = null
}

variable "name" {
  description = "The name (GUID) of the role assignment"
  type        = string
  default     = null
}
