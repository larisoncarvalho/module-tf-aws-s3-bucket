variable "bucket" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm"
  type        = string
}

variable "bucket_key_enabled" {
  description = "Whether S3 Bucket Key is enabled"
  type        = bool
}

variable "block_public_acls" {
  description = "Whether to block public ACLs"
  type        = bool
}

variable "block_public_policy" {
  description = "Whether to block public bucket policies"
  type        = bool
}

variable "ignore_public_acls" {
  description = "Whether to ignore public ACLs"
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Whether to restrict public bucket policies"
  type        = bool
}

variable "object_ownership" {
  description = "Object ownership setting for the bucket"
  type        = string
}