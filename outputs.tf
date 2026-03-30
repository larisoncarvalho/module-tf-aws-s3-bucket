output "bucket_id" {
  description = "The name of the private runner storage backend bucket"
  value       = module.private_runner_storage_backend.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the private runner storage backend bucket"
  value       = module.private_runner_storage_backend.bucket_arn
}