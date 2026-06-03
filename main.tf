module "role_definition" {
  source = "./modules/role_definition"

  role_definition_id       = var.role_definition_id
  name                     = var.name
  scope                    = var.scope
  description              = var.description
  assignable_scopes        = var.assignable_scopes
  permissions_actions      = var.permissions_actions
  permissions_data_actions = var.permissions_data_actions
}