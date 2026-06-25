resource "azurerm_network_interface" "this" {
  name                           = var.name
  resource_group_name            = var.resource_group_name
  location                       = var.location
  accelerated_networking_enabled = var.enable_accelerated_networking
  ip_forwarding_enabled          = var.ip_forwarding_enabled
  tags                           = var.tags

  dynamic "ip_configuration" {
    for_each = var.ip_configurations
    content {
      name                          = ip_configuration.value.name
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      private_ip_address            = ip_configuration.value.private_ip_address
      public_ip_address_id          = ip_configuration.value.public_ip_address_id
      subnet_id                     = ip_configuration.value.subnet_id
      primary                       = ip_configuration.value.primary
    }
  }
}
