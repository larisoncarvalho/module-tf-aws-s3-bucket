variable "region" {
  description = "The GCP region for the provider"
  type        = string
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "bucket_location" {
  description = "The GCS location of the bucket"
  type        = string
}

variable "bucket_storage_class" {
  description = "The storage class of the bucket"
  type        = string
}

variable "bucket_uniform_bucket_level_access" {
  description = "Enables uniform bucket-level access on the bucket"
  type        = bool
}

variable "bucket_default_event_based_hold" {
  description = "Whether to automatically apply an eventBasedHold to new objects"
  type        = bool
}

variable "bucket_requester_pays" {
  description = "Enables Requester Pays on the bucket"
  type        = bool
}