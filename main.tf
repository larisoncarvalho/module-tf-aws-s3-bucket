module "azurenetwork_rg" {
  source = "./modules/resource_group"

  location = var.region
  name     = "azurenetwork"
  tags = {
    app         = "azurenetwork"
    creator     = "stackgurdian"
    environment = "default"
  }
}

module "azurestack101_rg" {
  source = "./modules/resource_group"

  location = var.region
  name     = "azurestack101"
  tags = {
    app         = "azurestack101"
    creator     = "stackgurdian"
    environment = "azurestack101"
  }
}

module "azurestackoct11_rg" {
  source = "./modules/resource_group"

  location = var.region
  name     = "azurestackoct11"
  tags = {
    creator     = "stackgurdian"
    environment = "default"
  }
}

module "custom_name_3_rg" {
  source = "./modules/resource_group"

  location = var.region
  name     = "custom-name-3"
  tags = {
    creator     = "stackgurdian"
    environment = "default"
  }
}

module "custom_name_4_rg" {
  source = "./modules/resource_group"

  location = var.region
  name     = "custom-name-4"
  tags = {
    creator     = "stackgurdian"
    environment = "default"
  }
}

module "azurenetworknet_vnet" {
  source = "./modules/virtual_network"

  address_prefixes = ["10.0.0.0/16"]
  location         = module.azurenetwork_rg.location
  name             = "azurenetworknet"
  resource_group   = module.azurenetwork_rg.name
  tags = {
    ENV = "test"
  }
}

module "acctvnet2_vnet" {
  source = "./modules/virtual_network"

  address_prefixes = ["10.0.0.0/16"]
  location         = module.azurestackoct11_rg.location
  name             = "acctvnet2"
  resource_group   = module.azurestackoct11_rg.name
  tags = {
    ENV = "test"
  }
}

module "vm_name_nsg" {
  source = "./modules/network_security_group"

  location       = var.germanywestcentral_region
  name           = "vm-name-nsg"
  resource_group = var.jo_test_resource_group
  tags = {
    source = "terraform"
  }
  security_rules = {
    allow_remote_22_in_all = {
      access                     = "Allow"
      description                = "Allow remote protocol in from all locations"
      destination_address_prefix = "*"
      destination_port_range     = "22"
      direction                  = "Inbound"
      name                       = "allow_remote_22_in_all"
      priority                   = 101
      protocol                   = "Tcp"
      source_address_prefix      = null
      source_address_prefixes    = ["0.0.0.0/0"]
      source_port_range          = "*"
    }
  }
}

module "vm_name_pip_0" {
  source = "./modules/public_ip"

  location                     = var.germanywestcentral_region
  name                         = "vm-name-pip-0"
  public_ip_address_version    = "IPv4"
  public_ip_allocation_method  = "Dynamic"
  resource_group               = var.jo_test_resource_group
  sku_name                     = "Basic"
  tags = {
    source = "terraform"
  }
}

module "vm_name_nic_0" {
  source = "./modules/network_interface"

  enable_accelerated_networking = false
  enable_ip_forwarding          = false
  location                      = var.germanywestcentral_region
  name                          = "vm-name-nic-0"
  network_security_group_id     = module.vm_name_nsg.id
  resource_group                = var.jo_test_resource_group
  tags = {
    source = "terraform"
  }
  ip_configurations = [
    {
      name                         = "vm-name-ip-0"
      primary                      = true
      private_ip_address_version   = "IPv4"
      private_ip_allocation_method = "Dynamic"
      public_ip_address_id         = module.vm_name_pip_0.id
      subnet_id                    = var.jo_vnet_subnet2_id
    }
  ]
}