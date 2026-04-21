variable "name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "path" {
  description = "Path in which to create the policy"
  type        = string
}

variable "policy" {
  description = "JSON formatted policy document"
  type        = string
}