# S3 bucket with server-side encryption (AES256), versioning enabled, and custom ACL grant for canonical user.
module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket = var.bucket
  tags   = var.tags
}