module "cloudformation_stack" {
  source = "./modules/cloudformation_stack"

  name             = var.cloudformation_stack_name
  disable_rollback = var.cloudformation_stack_disable_rollback
}