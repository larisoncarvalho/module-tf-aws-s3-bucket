resource "azurerm_role_definition" "this" {
  name        = var.role_name
  scope       = var.scope
  description = var.description

  permissions {
    actions = var.actions
  }

  assignable_scopes = var.assignable_scopes
}