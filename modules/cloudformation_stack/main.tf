resource "aws_cloudformation_stack" "this" {
  name             = var.name
  disable_rollback = var.disable_rollback
  template_body    = var.template_body
}