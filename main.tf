module "s3_private_runner_storage" {
  source = "./modules/s3_bucket"

  bucket                  = var.s3_private_runner_storage.bucket
  sse_algorithm           = var.s3_private_runner_storage.sse_algorithm
  bucket_key_enabled      = var.s3_private_runner_storage.bucket_key_enabled
  block_public_acls       = var.s3_private_runner_storage.block_public_acls
  block_public_policy     = var.s3_private_runner_storage.block_public_policy
  ignore_public_acls      = var.s3_private_runner_storage.ignore_public_acls
  restrict_public_buckets = var.s3_private_runner_storage.restrict_public_buckets
  object_ownership        = var.s3_private_runner_storage.object_ownership
}