resource "aws_cloudformation_stack" "this" {
  name              = var.name
  disable_rollback  = var.disable_rollback
  notification_arns = var.notification_arns
  tags              = var.tags

  lifecycle {
    ignore_changes = [
      # template_body and parameters are write-only / managed externally
      template_body,
      template_url,
      parameters,
      capabilities,
      on_failure,
    ]
  }
}
