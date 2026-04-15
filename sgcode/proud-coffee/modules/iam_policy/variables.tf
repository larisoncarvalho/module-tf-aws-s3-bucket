variable "policy_name" {
  type        = string
  description = "Name of the IAM policy"
}

variable "path" {
  type        = string
  description = "Path for the policy"
}

variable "policy_document" {
  type        = string
  description = "JSON policy document"
}