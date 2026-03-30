module "private_runner_storage_backend" {
  source = "./modules/s3_bucket"

  bucket                  = var.private_runner_storage_backend.bucket
  sse_algorithm           = var.private_runner_storage_backend.sse_algorithm
  bucket_key_enabled      = var.private_runner_storage_backend.bucket_key_enabled
  block_public_acls       = var.private_runner_storage_backend.block_public_acls
  block_public_policy     = var.private_runner_storage_backend.block_public_policy
  ignore_public_acls      = var.private_runner_storage_backend.ignore_public_acls
  restrict_public_buckets = var.private_runner_storage_backend.restrict_public_buckets
  object_ownership        = var.private_runner_storage_backend.object_ownership
}