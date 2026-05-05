variable "region" {
  description = "AWS region where resources will be managed"
  type        = string
}

variable "bucket" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket and all objects when the bucket is destroyed"
  type        = bool
}

variable "object_lock_enabled" {
  description = "Whether object lock is enabled on the bucket"
  type        = bool
}

variable "tags" {
  description = "Tags to assign to the bucket"
  type        = map(string)
  default     = {}
}