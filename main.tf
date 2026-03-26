module "subnet1" {
  source = "./modules/subnet"

  subnet_name                                   = "subnet1"
  resource_group_name                           = "afsff"
  virtual_network_name                          = "sfadf"
  address_prefixes                              = ["10.100.1.0/24"]
  default_outbound_access_enabled               = true
  private_endpoint_network_policies_enabled     = true
  private_link_service_network_policies_enabled = true
}