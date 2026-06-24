cloudformation_stacks = {
  stulyze_app = {
    name              = "stulyze-app"
    disable_rollback  = false
    notification_arns = []
    tags              = {}
  }
}

athena_workgroups = {
  primary = {
    name                               = "primary"
    description                        = ""
    state                              = "ENABLED"
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    tags                               = {}
  }
}
