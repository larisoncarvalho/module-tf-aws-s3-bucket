variable "region" {
  type        = string
  description = "AWS region"
}

variable "s3_private_runner_storage_backend" {
  type = object({
    bucket                  = string
    sse_algorithm           = string
    bucket_key_enabled      = bool
    block_public_acls       = bool
    block_public_policy     = bool
    ignore_public_acls      = bool
    restrict_public_buckets = bool
    object_ownership        = string
    cors_rules = list(object({
      allowed_headers = optional(list(string))
      allowed_methods = list(string)
      allowed_origins = list(string)
      expose_headers  = optional(list(string))
      max_age_seconds = optional(number)
    }))
  })
  description = "Configuration for S3 private runner storage backend"
}