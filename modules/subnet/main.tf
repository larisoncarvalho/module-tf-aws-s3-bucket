resource "azurerm_subnet" "this" {
  address_prefixes                              = var.address_prefixes
  default_outbound_access_enabled               = var.default_outbound_access_enabled
  name                                          = var.subnet_name
  private_endpoint_network_policies_enabled     = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.virtual_network_name
}