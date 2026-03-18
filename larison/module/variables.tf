variable "region" {
  description = "AWS region"
  type        = string
}

variable "s3_private_runner_storage_backend" {
  description = "Configuration for the private runner storage backend S3 bucket"
  type = object({
    bucket                  = string
    sse_algorithm           = string
    bucket_key_enabled      = bool
    block_public_acls       = bool
    block_public_policy     = bool
    ignore_public_acls      = bool
    restrict_public_buckets = bool
    object_ownership        = string
    cors_rules = optional(list(object({
      allowed_headers = optional(list(string))
      allowed_methods = list(string)
      allowed_origins = list(string)
      expose_headers  = optional(list(string))
      max_age_seconds = optional(number)
    })), [])
  })
}