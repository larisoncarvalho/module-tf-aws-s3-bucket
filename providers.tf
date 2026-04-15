provider "azurerm" {
  features {}
  skip_provider_registration = true
  use_cli                    = false
  use_msi                    = false
  use_oidc                   = true
}