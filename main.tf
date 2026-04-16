module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  name                               = var.athena_workgroup_name
  state                              = var.athena_workgroup_state
  enforce_workgroup_configuration    = var.athena_workgroup_enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = var.athena_workgroup_publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = var.athena_workgroup_requester_pays_enabled
  selected_engine_version            = var.athena_workgroup_selected_engine_version
}