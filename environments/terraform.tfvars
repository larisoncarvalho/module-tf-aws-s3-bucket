resource_groups = {
  azurenetwork = {
    name     = "azurenetwork"
    location = "eastus"
    tags     = {}
  }
  azurestack101 = {
    name     = "azurestack101"
    location = "eastus"
    tags     = {}
  }
  azurestackoct11 = {
    name     = "azurestackoct11"
    location = "eastus"
    tags     = {}
  }
}

virtual_network_azurenetworknet = {
  name          = "azurenetworknet"
  location      = "eastus"
  address_space = ["10.0.0.0/16"]
  tags          = {}
}