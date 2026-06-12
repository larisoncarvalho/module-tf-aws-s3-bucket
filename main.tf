module "primary_workgroup" {
  source = "./modules/athena_workgroup"

  name                               = var.primary_workgroup_name
  state                              = var.primary_workgroup_state
  enforce_workgroup_configuration    = var.primary_workgroup_enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = var.primary_workgroup_publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = var.primary_workgroup_requester_pays_enabled
  selected_engine_version            = var.primary_workgroup_selected_engine_version
}

module "stulyze_app_stack" {
  source = "./modules/cloudformation_stack"

  name             = var.stulyze_app_stack_name
  disable_rollback = var.stulyze_app_stack_disable_rollback
  template_body    = var.stulyze_app_stack_template_body
}

module "igw_02aec4b4978ee2879" {
  source = "./modules/internet_gateway"

  vpc_id = var.igw_02aec4b4978ee2879_vpc_id
}