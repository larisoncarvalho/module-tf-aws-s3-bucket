variable "name" {
  description = "IAM role name"
  type        = string
}

variable "path" {
  description = "IAM role path"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy document"
  type        = any
}