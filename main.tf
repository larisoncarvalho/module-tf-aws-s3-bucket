module "private_runner_storage" {
  source = "./modules/s3_bucket"

  bucket_name             = "9ghvs69l-private-runner-storage-backend"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  sse_algorithm           = "AES256"
  bucket_key_enabled      = false
  object_ownership        = "BucketOwnerEnforced"
  versioning_status       = "Disabled"
}