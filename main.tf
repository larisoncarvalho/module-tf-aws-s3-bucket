module "s3_private_runner_storage_backend" {
  source = "./modules/s3_bucket"

  bucket = var.s3_private_runner_storage_backend.bucket
}