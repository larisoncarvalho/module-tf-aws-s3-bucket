resource "azurerm_role_assignment" "this" {
  name               = var.name
  principal_id       = var.principal_id
  role_definition_id = var.role_definition_id
  scope              = var.scope
}