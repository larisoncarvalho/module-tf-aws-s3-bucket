module "virtual_network" {
  source = "./modules/virtual_network"

  name                   = var.virtual_network_name
  resource_group_name    = var.resource_group_name
  location               = var.region
  address_prefixes       = var.address_prefixes
  enable_ddos_protection = var.enable_ddos_protection
  tags                   = var.tags
}