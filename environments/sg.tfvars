aws_cloudformation_stacks = {
  stulyze_app = {
    name             = "stulyze-app"
    disable_rollback = false
  }
}

aws_athena_workgroups = {
  primary = {
    name                            = "primary"
    enforce_workgroup_configuration = false
    publish_cloudwatch_metrics      = true
    requester_pays_enabled          = false
    selected_engine_version         = "AUTO"
  }
}
