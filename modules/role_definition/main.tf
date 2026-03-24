resource "azurerm_role_definition" "this" {
  description = var.description
  name        = var.role_name
  scope       = var.scope

  permissions {
    actions          = var.actions
    data_actions     = []
    not_actions      = []
    not_data_actions = []
  }

  assignable_scopes = var.assignable_scopes
}