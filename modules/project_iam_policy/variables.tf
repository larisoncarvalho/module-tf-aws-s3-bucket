variable "project" {
  description = "The GCP project ID to apply the IAM policy to"
  type        = string
}

variable "policy_data" {
  description = "The IAM policy data JSON (policy_data from google_iam_policy data source)"
  type        = string
}