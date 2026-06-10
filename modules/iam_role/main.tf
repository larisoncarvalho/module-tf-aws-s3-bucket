resource "aws_iam_role" "this" {
  assume_role_policy    = var.assume_role_policy
  force_detach_policies = var.force_detach_policies
  managed_policy_arns   = var.managed_policy_arns
  max_session_duration  = var.max_session_duration
  name                  = var.name
  path                  = var.path

  dynamic "inline_policy" {
    for_each = var.inline_policy
    content {
      name   = inline_policy.value.name
      policy = inline_policy.value.policy
    }
  }
}