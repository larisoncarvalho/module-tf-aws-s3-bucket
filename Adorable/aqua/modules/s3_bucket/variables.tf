variable "bucket" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm"
  type        = string
}

variable "bucket_key_enabled" {
  description = "Whether S3 Bucket Key is enabled for SSE-KMS"
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
  description = "Object ownership control setting"
  type        = string
}

variable "cors_rules" {
  description = "CORS rules for the bucket"
  type = list(object({
    allowed_headers = optional(list(string))
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = optional(list(string))
    max_age_seconds = optional(number)
  }))
}