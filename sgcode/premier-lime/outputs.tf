output "bigquery_dataset_ids" {
  description = "BigQuery dataset IDs"
  value       = { for k, v in module.bigquery_dataset : k => v.dataset_id }
}
