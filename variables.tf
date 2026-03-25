variable "region" {
  description = "AWS region"
  type        = string
}

variable "s3_private_runner_storage_backend" {
  description = "Configuration for S3 private runner storage backend"
  type = object({
    bucket                  = string
    sse_algorithm           = string
    bucket_key_enabled      = bool
    block_public_acls       = bool
    block_public_policy     = bool
    ignore_public_acls      = bool
    restrict_public_buckets = bool
    object_ownership        = string
  })
}