output "storage_account_ids" {
  description = "Map of storage account IDs keyed by storage account map key."
  value       = { for k, v in module.storage_accounts : k => v.storage_account_id }
}

output "storage_account_names" {
  description = "Map of storage account names keyed by storage account map key."
  value       = { for k, v in module.storage_accounts : k => v.storage_account_name }
}

output "storage_primary_blob_endpoints" {
  description = "Map of primary blob endpoints keyed by storage account map key."
  value       = { for k, v in module.storage_accounts : k => v.storage_primary_blob_endpoint }
}