athena_workgroups = {
  primary = {
    name                               = "primary"
    description                        = ""
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    selected_engine_version            = "AUTO"
    state                              = "ENABLED"
  }
}

cloudformation_stacks = {
  stulyze_app = {
    name                          = "stulyze-app"
    disable_rollback              = false
    enable_termination_protection = false
    notification_arns             = []
    tags                          = {}
  }
}
