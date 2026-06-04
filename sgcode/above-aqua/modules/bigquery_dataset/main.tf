resource "google_bigquery_dataset" "this" {
  dataset_id  = var.dataset_id
  project     = var.project
  location    = var.location
  description = var.description
  labels      = var.labels

  dynamic "access" {
    for_each = var.access
    content {
      role           = access.value.role
      special_group  = access.value.special_group
      user_by_email  = access.value.user_by_email
      group_by_email = access.value.group_by_email
      domain         = access.value.domain
      iam_member     = access.value.iam_member
    }
  }
}
