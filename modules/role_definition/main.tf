resource "azurerm_role_definition" "this" {
  role_definition_id = var.role_definition_id
  name               = var.name
  scope              = var.scope
  description        = var.description
  assignable_scopes  = var.assignable_scopes

  permissions {
    actions      = var.permissions_actions
    data_actions = var.permissions_data_actions
  }
}