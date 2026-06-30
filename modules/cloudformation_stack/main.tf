resource "aws_cloudformation_stack" "this" {
  name              = var.name
  disable_rollback  = var.disable_rollback
  notification_arns = var.notification_arns
  tags              = var.tags

  lifecycle {
    ignore_changes = [
      # Template body and parameters are managed outside of Terraform (deployed via CLI)
      template_body,
      template_url,
      parameters,
    ]
  }
}
