module "kms_key_ring" {
  source   = "./modules/kms_key_ring"
  for_each = var.kms_key_rings

  name     = each.value.name
  location = each.value.location
  project  = each.value.project
}
