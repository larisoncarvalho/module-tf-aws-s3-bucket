resource "aws_cloudformation_stack" "this" {
  name              = var.name
  disable_rollback  = var.disable_rollback
  notification_arns = var.notification_arns
  tags              = var.tags
}
