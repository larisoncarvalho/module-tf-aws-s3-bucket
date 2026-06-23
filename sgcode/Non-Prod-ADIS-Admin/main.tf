modular "bucket" {
  source   = "./modules/bucket"
  for_each = var.buckets

  name = each.value.name
}