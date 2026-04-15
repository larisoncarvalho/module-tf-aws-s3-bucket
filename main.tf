module "aksljdfhlkjasdhflkjashdflhasdlkjf_count_0" {
  source = "./modules/s3_bucket"

  bucket_name             = "aksljdfhlkjasdhflkjashdflhasdlkjf-count-0"
  versioning_status       = "Enabled"
  mfa_delete              = "Disabled"
  sse_algorithm           = "AES256"
  bucket_key_enabled      = false
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  object_ownership        = "BucketOwnerEnforced"
}