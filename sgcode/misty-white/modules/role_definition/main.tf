resource "azurerm_role_definition" "this" {
  assignable_scopes  = var.assignable_scopes
  description        = var.description
  name               = var.role_name
  role_definition_id = var.role_definition_id
  scope              = var.scope

  permissions {
    actions = var.actions
  }
}