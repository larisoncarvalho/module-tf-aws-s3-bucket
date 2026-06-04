variable "name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "location" {
  description = "The GCS location of the bucket"
  type        = string
}

variable "storage_class" {
  description = "The storage class of the bucket"
  type        = string
}

variable "uniform_bucket_level_access" {
  description = "Enables uniform bucket-level access on the bucket"
  type        = bool
}

variable "default_event_based_hold" {
  description = "Whether to automatically apply an eventBasedHold to new objects"
  type        = bool
}

variable "requester_pays" {
  description = "Enables Requester Pays on the bucket"
  type        = bool
}