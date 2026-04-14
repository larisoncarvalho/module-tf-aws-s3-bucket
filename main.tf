module "cloudformation_stack" {
  source           = "./modules/cloudformation_stack"
  name             = var.stulyze_app_name
  disable_rollback = var.stulyze_app_disable_rollback
}