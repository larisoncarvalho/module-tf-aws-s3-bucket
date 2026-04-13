region                 = "germanywestcentral"
virtual_network_name   = "dev-test-vnet"
resource_group_name    = "dev-test-rg"
address_prefixes       = ["10.100.0.0/16"]
enable_ddos_protection = false
tags = {
  ENV = "test"
}