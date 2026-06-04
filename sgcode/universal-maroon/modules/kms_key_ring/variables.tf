variable "name" {
  description = "The name of the KMS key ring"
  type        = string
}

variable "location" {
  description = "The location of the KMS key ring"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}
