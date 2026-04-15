output "bucket_id" {
  description = "THE NAME OF THE S3 BUCKET"
  value       = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  description = "THE ARN OF THE S3 BUCKET"
  value       = module.s3_bucket.bucket_arn
}