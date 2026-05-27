variable "project" {
  description = "The GCP project ID to apply the organization policy to"
  type        = string
}

variable "constraint" {
  description = "The constraint identifier for the organization policy"
  type        = string
}