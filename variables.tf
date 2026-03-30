variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "private_runner_storage_backend" {
  description = "Configuration for private runner storage backend S3 bucket"
  type = object({
    bucket                  = string
    sse_algorithm           = string
    bucket_key_enabled      = bool
    block_public_acls       = bool
    block_public_policy     = bool
    ignore_public_acls      = bool
    restrict_public_buckets = bool
    object_ownership        = string
    versioning_status       = string
  })
}