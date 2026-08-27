resource "aws_cloudformation_stack" "this" {
  name             = var.name
  disable_rollback = var.disable_rollback

  lifecycle {
    ignore_changes = [template_body, template_url, parameters, capabilities, on_failure, timeout_in_minutes, notification_arns, policy_body, policy_url, iam_role_arn, tags]
  }
}
