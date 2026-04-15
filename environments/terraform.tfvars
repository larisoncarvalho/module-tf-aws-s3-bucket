region = "eastus"

resource_groups = {
  azurenetwork = {
    location = "eastus"
    tags = {
      app         = "azurenetwork"
      creator     = "stackgurdian"
      environment = "default"
    }
  }
  azurestack101 = {
    location = "eastus"
    tags = {
      app         = "azurestack101"
      creator     = "stackgurdian"
      environment = "azurestack101"
    }
  }
  azurestackoct11 = {
    location = "eastus"
    tags = {
      creator     = "stackgurdian"
      environment = "default"
    }
  }
}

subnets = {
  subnet1 = {
    address_prefixes = []
  }
  subnet2 = {
    address_prefixes = []
  }
  subnet3 = {
    address_prefixes = []
  }
}