module "kms_key_ring" {
  source   = "./modules/kms_key_ring"
  name     = var.name
  location = var.location
  project  = var.project
}