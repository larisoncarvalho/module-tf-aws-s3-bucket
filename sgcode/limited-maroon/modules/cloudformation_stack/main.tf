resource "aws_cloudformation_stack" "this" {
  name             = var.name
  disable_rollback = var.disable_rollback
}