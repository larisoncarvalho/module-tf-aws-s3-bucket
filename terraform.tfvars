resource_groups = {
  azurenetwork = {
    name     = "azurenetwork"
    location = "eastus"
    tags = {
      app         = "azurenetwork"
      creator     = "stackgurdian"
      environment = "default"
    }
  }
  azurestack101 = {
    name     = "azurestack101"
    location = "eastus"
    tags = {
      app         = "azurestack101"
      creator     = "stackgurdian"
      environment = "azurestack101"
    }
  }
  azurestackoct11 = {
    name     = "azurestackoct11"
    location = "eastus"
    tags = {
      creator     = "stackgurdian"
      environment = "default"
    }
  }
}

virtual_network_azurenetworknet = {
  name          = "azurenetworknet"
  location      = "eastus"
  address_space = ["10.0.0.0/16"]
  tags = {
    ENV = "test"
  }
}