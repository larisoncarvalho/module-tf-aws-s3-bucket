resource "aws_iam_role" "this" {
  name                 = var.role_name
  path                 = var.path
  max_session_duration = var.max_session_duration
  assume_role_policy   = jsonencode(var.assume_role_policy_document)
}

resource "aws_iam_role_policy" "this" {
  for_each = var.inline_policies

  role   = aws_iam_role.this.name
  name   = each.value.policy_name
  policy = jsonencode(each.value.policy_document)
}