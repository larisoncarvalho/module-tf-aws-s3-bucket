module "azurenetwork" {
  source = "./modules/resource_group"

  location = "eastus"
  name     = "azurenetwork"
  tags = {
    app         = "azurenetwork"
    creator     = "stackgurdian"
    environment = "default"
  }
}