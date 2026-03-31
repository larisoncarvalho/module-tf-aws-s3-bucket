provider "azurerm" {
  features {}
  
  subscription_id = var.subscription_id
  
  # Use environment variables for authentication:
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID
}