variable "project" {
  description = "The GCP project ID to apply the IAM policy to"
  type        = string
}

variable "policy_data" {
  description = "The policy data JSON string containing all IAM bindings"
  type        = string
}