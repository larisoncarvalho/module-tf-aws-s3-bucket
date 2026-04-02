output "bucket_id" {
  description = "ID of the backend storage bucket"
  value       = module.backend_storage.bucket_id
}

output "bucket_arn" {
  description = "ARN of the backend storage bucket"
  value       = module.backend_storage.bucket_arn
}