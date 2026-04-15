module "cf_templates_bucket" {
  source = "./modules/s3_bucket"

  bucket_name             = "cf-templates-17ekzkilh9lar-eu-central-1"
  object_ownership        = "BucketOwnerEnforced"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  sse_algorithm           = "AES256"
  bucket_key_enabled      = false
  versioning_status       = "Disabled"
}