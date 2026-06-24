resource "aws_cloudformation_stack" "this" {
  name              = var.name
  disable_rollback  = var.disable_rollback
  notification_arns = var.notification_arns
  tags              = var.tags

  lifecycle {
    ignore_changes = [
      # Template body is managed outside Terraform (deployed via CLI/CI)
      template_body,
      template_url,
      parameters,
      capabilities,
      policy_body,
      policy_url,
    ]
  }
}
