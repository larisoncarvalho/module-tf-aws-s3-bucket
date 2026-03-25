output "bucket_id" {
  description = "S3 bucket ID"
  value       = module.s3_private_runner_storage_backend.bucket_id
}

output "bucket_arn" {
  description = "S3 bucket ARN"
  value       = module.s3_private_runner_storage_backend.bucket_arn
}