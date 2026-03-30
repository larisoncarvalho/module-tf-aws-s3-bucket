module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket_name              = "stackguardian-devoted-rat"
  object_ownership         = "BucketOwnerPreferred"
  block_public_acls        = false
  block_public_policy      = false
  ignore_public_acls       = false
  restrict_public_buckets  = false
  owner_canonical_user_id  = "9384ba540c1093b9523308500d905bb6385ccb904afa22a41b8309ad4cc458ff"
  bucket_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "s3:*"
        Effect    = "Allow"
        Principal = "*"
        Resource  = "arn:aws:s3:::stackguardian-devoted-rat/*"
      },
      {
        Sid       = "PublicReadGetObject"
        Action    = "s3:GetObject"
        Effect    = "Allow"
        Principal = "*"
        Resource  = "arn:aws:s3:::stackguardian-devoted-rat/*"
      }
    ]
  })
  sse_algorithm         = "AES256"
  bucket_key_enabled    = false
  index_document_suffix = "index.html"
  error_document_key    = "error.html"
}