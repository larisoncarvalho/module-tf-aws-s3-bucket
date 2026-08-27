module "role_assignment" {
  source   = "./modules/role_assignment"
  for_each = var.role_assignments

  scope              = each.value.scope
  role_definition_id = each.value.role_definition_id
  principal_id       = each.value.principal_id
  principal_type     = each.value.principal_type
  name               = each.value.name
}
