resource "azurerm_network_security_group" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name

  security_rule {
    access                     = var.security_rule_access
    destination_address_prefix = var.security_rule_destination_address_prefix
    destination_port_range     = var.security_rule_destination_port_range
    direction                  = var.security_rule_direction
    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    protocol                   = var.security_rule_protocol
    source_address_prefix      = var.security_rule_source_address_prefix
    source_port_range          = var.security_rule_source_port_range
  }
}