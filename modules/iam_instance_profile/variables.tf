variable "name" {
  description = "Instance profile name"
  type        = string
}

variable "path" {
  description = "Instance profile path"
  type        = string
}

variable "role_name" {
  description = "IAM role name to attach"
  type        = string
}