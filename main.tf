module "key_vault_administrator" {
  source = "./modules/role_definition"

  role_name         = var.key_vault_administrator.role_name
  scope             = var.key_vault_administrator.scope
  description       = var.key_vault_administrator.description
  actions           = var.key_vault_administrator.actions
  assignable_scopes = var.key_vault_administrator.assignable_scopes
}