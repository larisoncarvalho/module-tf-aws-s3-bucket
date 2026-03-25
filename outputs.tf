output "bucket_id" {
  description = "S3 bucket ID for private runner storage backend"
  value       = module.s3_private_runner_storage_backend.bucket_id
}

output "bucket_arn" {
  description = "S3 bucket ARN for private runner storage backend"
  value       = module.s3_private_runner_storage_backend.bucket_arn
}