resource "azurerm_virtual_network" "this" {
  address_space       = var.address_prefixes
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group
  tags                = var.tags
}