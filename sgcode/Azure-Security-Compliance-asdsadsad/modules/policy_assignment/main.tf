resource "azurerm_subscription_policy_assignment" "this" {
  name                 = var.name
  subscription_id      = var.subscription_id
  policy_definition_id = var.policy_definition_id
  description          = var.description
  display_name         = var.display_name
  enforce              = var.enforce
  not_scopes           = var.not_scopes
  parameters           = var.parameters
}
