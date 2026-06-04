output "bucket_name" {
  description = "The name of the GCS bucket"
  value       = module.storage_bucket.bucket_name
}

output "bucket_url" {
  description = "The base URL of the bucket"
  value       = module.storage_bucket.bucket_url
}

output "self_link" {
  description = "The URI of the created resource"
  value       = module.storage_bucket.self_link
}