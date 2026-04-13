module "role_assignment" {
  source             = "./modules/role_assignment"
  name               = var.role_assignment_name
  principal_id       = var.principal_id
  role_definition_id = var.role_definition_id
  scope              = var.scope
}