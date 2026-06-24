# Root module — module calls only, no bare resource blocks

module "aws_cloudformation_stack" {
  source   = "./modules/aws_cloudformation_stack"
  for_each = var.aws_cloudformation_stacks

  name              = each.value.name
  disable_rollback  = each.value.disable_rollback
  notification_arns = each.value.notification_arns
  tags              = each.value.tags
}

module "aws_athena_workgroup" {
  source   = "./modules/aws_athena_workgroup"
  for_each = var.aws_athena_workgroups

  name                            = each.value.name
  description                     = each.value.description
  enforce_workgroup_configuration = each.value.enforce_workgroup_configuration
  publish_cloudwatch_metrics      = each.value.publish_cloudwatch_metrics
  requester_pays_enabled          = each.value.requester_pays_enabled
  selected_engine_version         = each.value.selected_engine_version
  tags                            = each.value.tags
}
