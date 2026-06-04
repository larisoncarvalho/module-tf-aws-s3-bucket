resource "google_storage_bucket" "this" {
  name                        = var.name
  location                    = var.location
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  default_event_based_hold    = var.default_event_based_hold
  requester_pays              = var.requester_pays

  encryption {
    customer_managed_encryption_enforcement_config {
      restriction_mode = "NotRestricted"
    }
    customer_supplied_encryption_enforcement_config {
      restriction_mode = "FullyRestricted"
    }
    google_managed_encryption_enforcement_config {
      restriction_mode = "NotRestricted"
    }
  }
}