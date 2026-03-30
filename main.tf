module "resource_groups" {
  source = "./modules/resource_group"

  resource_groups = var.resource_groups
}

module "virtual_network" {
  source = "./modules/virtual_network"

  address_prefixes       = ["10.0.0.0/16"]
  location               = var.region
  resource_group_name    = "azurenetwork"
  subnets                = var.subnets
  tags                   = { ENV = "test" }
  virtual_network_name   = "azurenetworknet"
}