module "cloudformation_stack" {
  source           = "./modules/cloudformation_stack"
  name             = var.name
  disable_rollback = var.disable_rollback
  tags             = var.tags
}