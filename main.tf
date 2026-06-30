module "cloudformation_stack" {
  source   = "./modules/cloudformation_stack"
  for_each = var.cloudformation_stacks

  name              = each.value.name
  disable_rollback  = each.value.disable_rollback
  notification_arns = each.value.notification_arns
  tags              = each.value.tags
}

module "athena_workgroup" {
  source   = "./modules/athena_workgroup"
  for_each = var.athena_workgroups

  name                               = each.value.name
  description                        = each.value.description
  state                              = each.value.state
  enforce_workgroup_configuration    = each.value.enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = each.value.publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = each.value.requester_pays_enabled
  selected_engine_version            = each.value.selected_engine_version
  tags                               = each.value.tags
}
