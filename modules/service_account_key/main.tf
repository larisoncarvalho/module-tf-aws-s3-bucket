resource "google_service_account_key" "this" {
  for_each           = var.service_account_keys
  service_account_id = each.value.service_account_id
}