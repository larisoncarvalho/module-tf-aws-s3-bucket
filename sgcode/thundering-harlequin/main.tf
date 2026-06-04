module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  enforce_workgroup_configuration    = var.athena_workgroup_enforce_workgroup_configuration
  name                               = var.athena_workgroup_name
  publish_cloudwatch_metrics_enabled = var.athena_workgroup_publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = var.athena_workgroup_requester_pays_enabled
  selected_engine_version            = var.athena_workgroup_selected_engine_version
  state                              = var.athena_workgroup_state
}

module "iam_role" {
  source = "./modules/iam_role"

  assume_role_policy   = var.iam_role_assume_role_policy
  description          = var.iam_role_description
  max_session_duration = var.iam_role_max_session_duration
  name                 = var.iam_role_name
  path                 = var.iam_role_path
}