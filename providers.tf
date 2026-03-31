provider "azurerm" {
  features {}
  
  # Use environment variables for authentication:
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID
  use_cli = false
}