# S3 bucket with server-side encryption, versioning, and public access block configuration.
module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket                  = var.bucket
  tags                    = var.tags
  versioning_status       = var.versioning_status
  versioning_mfa_delete   = var.versioning_mfa_delete
  sse_algorithm           = var.sse_algorithm
  bucket_key_enabled      = var.bucket_key_enabled
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
  acl_grantee_id          = var.acl_grantee_id
  acl_grantee_type        = var.acl_grantee_type
  acl_permission          = var.acl_permission
  acl_owner_id            = var.acl_owner_id
}