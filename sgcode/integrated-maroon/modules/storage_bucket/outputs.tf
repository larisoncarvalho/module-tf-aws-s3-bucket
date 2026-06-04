output "bucket_name" {
  description = "The name of the GCS bucket"
  value       = google_storage_bucket.this.name
}

output "bucket_url" {
  description = "The base URL of the bucket"
  value       = google_storage_bucket.this.url
}

output "self_link" {
  description = "The URI of the created resource"
  value       = google_storage_bucket.this.self_link
}