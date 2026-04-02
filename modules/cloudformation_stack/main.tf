resource "aws_cloudformation_stack" "this" {
  capabilities     = var.capabilities
  disable_rollback = var.disable_rollback
  name             = var.stack_name
  parameters       = var.parameters
  template_body    = var.template_body
}