region = "eu-central-1"

s3_private_runner_storage = {
  bucket                  = "37lxrdhe-private-runner-storage-backend"
  sse_algorithm           = "AES256"
  bucket_key_enabled      = false
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  object_ownership        = "BucketOwnerEnforced"
}