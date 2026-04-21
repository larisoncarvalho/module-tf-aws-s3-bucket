variable "region" {
  description = "AWS region"
  type        = string
}

variable "iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "iam_policy_path" {
  description = "Path in which to create the policy"
  type        = string
}

variable "iam_policy_policy" {
  description = "JSON formatted policy document"
  type        = string
}