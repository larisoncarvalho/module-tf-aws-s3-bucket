resource "aws_cloudformation_stack" "this" {
  name               = var.name
  template_body      = var.template_body
  disable_rollback   = var.disable_rollback
  timeout_in_minutes = var.timeout_in_minutes
}