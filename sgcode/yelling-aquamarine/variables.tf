variable "region" {
  type        = string
  description = "The region for the provider"
}

variable "name" {
  type        = string
  description = "The resource name for the KMS Key Ring"
}

variable "location" {
  type        = string
  description = "The location for the KMS Key Ring"
}

variable "project" {
  type        = string
  description = "The ID of the GCP project"
}