variable "region" {
  description = "AWS region"
  type        = string
}

variable "s3_private_runner_storage_backend" {
  description = "Configuration for S3 private runner storage backend"
  type = object({
    bucket = string
  })
}