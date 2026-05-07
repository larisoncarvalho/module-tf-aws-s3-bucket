variable "region" {
  description = "AWS region"
  type        = string
}

variable "name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "path" {
  description = "Path in which to create the policy"
  type        = string
}

variable "policy" {
  description = "JSON-formatted IAM policy document"
  type        = string
}