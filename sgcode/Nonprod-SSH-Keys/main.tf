module "key_pair" {
  source   = "./modules/key_pair"
  for_each = var.key_pairs

  key_name   = each.value.key_name
  public_key = each.value.public_key
  tags       = each.value.tags
}
