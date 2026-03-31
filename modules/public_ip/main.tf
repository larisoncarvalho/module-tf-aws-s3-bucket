resource "azurerm_public_ip" "this" {
  allocation_method   = var.public_ip_allocation_method
  ip_version          = var.public_ip_address_version
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group
  sku                 = var.sku_name
  tags                = var.tags
}