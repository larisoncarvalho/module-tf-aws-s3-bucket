output "key_ids" {
  description = "Map of key identifiers for each managed service account key"
  value       = { for k, v in google_service_account_key.this : k => v.id }
}