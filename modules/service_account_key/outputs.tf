output "key_ids" {
  description = "Map of service account key IDs"
  value       = { for k, v in google_service_account_key.this : k => v.id }
}