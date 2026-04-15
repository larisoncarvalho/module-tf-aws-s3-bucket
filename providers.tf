provider "azurerm" {
  features {}
  
  skip_provider_registration = true
  use_cli                    = false
  use_msi                    = true
}