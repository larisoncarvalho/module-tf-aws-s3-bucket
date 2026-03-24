resource "aws_iam_role" "this" {
  name                 = var.role_name
  path                 = var.path
  assume_role_policy   = jsonencode(var.assume_role_policy_document)
  max_session_duration = var.max_session_duration
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.attached_policies

  role       = aws_iam_role.this.name
  policy_arn = each.value.policy_arn
}