output "bucket_id" {
  value       = module.private_runner_storage.bucket_id
  description = "The ID of the S3 bucket"
}

output "bucket_arn" {
  value       = module.private_runner_storage.bucket_arn
  description = "The ARN of the S3 bucket"
}