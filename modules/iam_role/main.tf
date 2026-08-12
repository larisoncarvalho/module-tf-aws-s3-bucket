resource "aws_iam_role" "this" {
  name                 = var.name
  path                 = var.path
  description          = var.description
  max_session_duration = var.max_session_duration
  assume_role_policy   = var.assume_role_policy
  tags                 = var.tags
}
