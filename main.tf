module "azurenetwork" {
  source = "./modules/resource_group"

  name     = "azurenetwork"
  location = var.region
  tags = {
    app         = "azurenetwork"
    creator     = "stackgurdian"
    environment = "default"
  }
}