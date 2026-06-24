cloudformation_stacks = {
  stulyze_app = {
    name              = "stulyze-app"
    disable_rollback  = false
    notification_arns = []
  }
}

athena_workgroups = {
  primary = {
    name                               = "primary"
    description                        = ""
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
  }
}
