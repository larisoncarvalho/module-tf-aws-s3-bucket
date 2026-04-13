provider "azurerm" {
  features {}
  skip_provider_registration = true

  environment = "public"
  metadata_host = "management.azure.com"

  auxiliary_tenant_ids = []
}