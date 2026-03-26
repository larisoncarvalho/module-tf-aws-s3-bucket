resource "azurerm_role_definition" "this" {
  name        = var.role_name
  scope       = var.assignable_scope
  description = var.description

  permissions {
    actions          = var.actions
    data_actions     = var.data_actions
    not_actions      = var.not_actions
    not_data_actions = var.not_data_actions
  }
}