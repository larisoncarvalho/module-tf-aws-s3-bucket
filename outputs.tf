output "bucket_id" {
  description = "The ID of the private runner storage bucket"
  value       = module.s3_private_runner_storage.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the private runner storage bucket"
  value       = module.s3_private_runner_storage.bucket_arn
}