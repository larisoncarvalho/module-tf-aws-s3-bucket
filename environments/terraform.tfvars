region = "eastus"

resource_groups = {
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