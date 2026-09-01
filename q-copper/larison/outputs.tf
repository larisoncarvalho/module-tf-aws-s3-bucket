output "bucket_id" {
  description = "The ID of the backend storage bucket"
  value       = module.backend_storage.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the backend storage bucket"
  value       = module.backend_storage.bucket_arn
}