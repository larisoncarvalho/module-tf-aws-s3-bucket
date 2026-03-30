module "resource_groups" {
  source = "./modules/resource_group"

  for_each = var.resource_groups

  location = each.value.location
  name     = each.value.name
  tags     = each.value.tags
}

module "virtual_network_azurenetworknet" {
  source = "./modules/virtual_network"

  address_space       = var.virtual_network_azurenetworknet.address_space
  location            = var.virtual_network_azurenetworknet.location
  name                = var.virtual_network_azurenetworknet.name
  resource_group_name = module.resource_groups["azurenetwork"].name
  tags                = var.virtual_network_azurenetworknet.tags
}