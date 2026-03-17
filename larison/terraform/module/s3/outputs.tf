output "bucket_id" {
  description = "ID of the private runner storage bucket"
  value       = module.private_runner_storage_backend.bucket_id
}

output "bucket_arn" {
  description = "ARN of the private runner storage bucket"
  value       = module.private_runner_storage_backend.bucket_arn
}