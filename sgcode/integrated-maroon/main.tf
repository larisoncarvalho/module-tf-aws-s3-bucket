module "storage_bucket" {
  source = "./modules/storage_bucket"

  name                        = var.bucket_name
  location                    = var.bucket_location
  storage_class               = var.bucket_storage_class
  uniform_bucket_level_access = var.bucket_uniform_bucket_level_access
  default_event_based_hold    = var.bucket_default_event_based_hold
  requester_pays              = var.bucket_requester_pays
}