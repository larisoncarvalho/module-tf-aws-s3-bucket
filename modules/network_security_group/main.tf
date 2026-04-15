resource "azurerm_network_security_group" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_network_security_rule" "this" {
  for_each = var.security_rules

  access                      = each.value.access
  destination_address_prefix  = each.value.destination_address_prefix
  destination_port_range      = each.value.destination_port_range
  direction                   = each.value.direction
  name                        = each.value.name
  network_security_group_name = azurerm_network_security_group.this.name
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  resource_group_name         = var.resource_group
  source_address_prefix       = each.value.source_address_prefix
  source_address_prefixes     = each.value.source_address_prefixes
  source_port_range           = each.value.source_port_range
  description                 = each.value.description
}