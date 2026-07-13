module "subnet" {
  source   = "./modules/subnet"
  for_each = var.subnets

  cidr_block              = each.value.cidr_block
  vpc_id                  = each.value.vpc_id
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}
