resource "azurerm_network_interface" "this" {
  enable_accelerated_networking = var.enable_accelerated_networking
  enable_ip_forwarding          = var.enable_ip_forwarding
  location                      = var.location
  name                          = var.name
  resource_group_name           = var.resource_group
  tags                          = var.tags

  dynamic "ip_configuration" {
    for_each = var.ip_configurations
    content {
      name                          = ip_configuration.value.name
      primary                       = ip_configuration.value.primary
      private_ip_address_allocation = ip_configuration.value.private_ip_allocation_method
      private_ip_address_version    = ip_configuration.value.private_ip_address_version
      public_ip_address_id          = ip_configuration.value.public_ip_address_id
      subnet_id                     = ip_configuration.value.subnet_id
    }
  }
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = var.network_security_group_id
}