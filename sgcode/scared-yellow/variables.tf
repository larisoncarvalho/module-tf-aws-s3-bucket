variable "region" {
  description = "The region for the stack"
  type        = string
}

variable "project" {
  description = "The GCP project ID to apply the IAM policy to"
  type        = string
}

variable "bindings" {
  description = "List of IAM role bindings to apply to the project"
  type        = list(object({ role = string, members = list(string) }))
}