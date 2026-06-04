module "bigquery_dataset" {
  source   = "./modules/bigquery_dataset"
  for_each = var.bigquery_datasets

  dataset_id  = each.value.dataset_id
  project     = each.value.project
  location    = each.value.location
  description = each.value.description
  labels      = each.value.labels
  access      = each.value.access
}
