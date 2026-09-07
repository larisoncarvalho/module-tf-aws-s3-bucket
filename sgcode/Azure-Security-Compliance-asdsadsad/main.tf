module "policy_assignment" {
  source   = "./modules/policy_assignment"
  for_each = var.policy_assignments

  name                 = each.value.name
  subscription_id      = each.value.subscription_id
  policy_definition_id = each.value.policy_definition_id
  description          = each.value.description
  display_name         = each.value.display_name
  enforce              = each.value.enforce
  not_scopes           = each.value.not_scopes
  parameters           = each.value.parameters
}

module "role_assignment" {
  source   = "./modules/role_assignment"
  for_each = var.role_assignments

  scope              = each.value.scope
  role_definition_id = each.value.role_definition_id
  principal_id       = each.value.principal_id
  principal_type     = each.value.principal_type
  name               = each.value.name
}
