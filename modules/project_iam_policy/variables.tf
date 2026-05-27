variable "project" {
  description = "The GCP project ID to apply the IAM policy to"
  type        = string
}

variable "policy_data" {
  description = "The IAM policy data (JSON) containing all role bindings"
  type        = string
}