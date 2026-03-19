module "s3_private_runner_storage_backend" {
  source = "./modules/s3_bucket"

  bucket                  = var.s3_private_runner_storage_backend.bucket
  sse_algorithm           = var.s3_private_runner_storage_backend.sse_algorithm
  bucket_key_enabled      = var.s3_private_runner_storage_backend.bucket_key_enabled
  block_public_acls       = var.s3_private_runner_storage_backend.block_public_acls
  block_public_policy     = var.s3_private_runner_storage_backend.block_public_policy
  ignore_public_acls      = var.s3_private_runner_storage_backend.ignore_public_acls
  restrict_public_buckets = var.s3_private_runner_storage_backend.restrict_public_buckets
  object_ownership        = var.s3_private_runner_storage_backend.object_ownership
  cors_rules              = var.s3_private_runner_storage_backend.cors_rules
}