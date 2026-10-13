module "role_definition" {
  source   = "./modules/role_definition"
  for_each = var.role_definitions

  role_name         = each.value.role_name
  scope             = each.value.scope
  description       = each.value.description
  assignable_scopes = each.value.assignable_scopes
  permissions       = each.value.permissions
}
