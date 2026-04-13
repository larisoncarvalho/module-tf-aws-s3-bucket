variable "name" {
  type        = string
  description = "The GUID name of the role assignment"
}

variable "principal_id" {
  type        = string
  description = "The object ID of the user principal to assign the role to"
}

variable "role_definition_id" {
  type        = string
  description = "The fully qualified ID of the role definition to assign"
}

variable "scope" {
  type        = string
  description = "The scope at which the role assignment applies"
}