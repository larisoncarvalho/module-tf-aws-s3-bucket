module "s3_bucket" {
  source              = "./modules/s3_bucket"
  bucket              = var.bucket
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
  tags                = var.tags
}