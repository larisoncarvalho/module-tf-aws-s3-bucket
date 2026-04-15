output "bucket_id" {
  value       = module.backend_storage.bucket_id
  description = "The ID of the backend storage S3 bucket"
}

output "bucket_arn" {
  value       = module.backend_storage.bucket_arn
  description = "The ARN of the backend storage S3 bucket"
}