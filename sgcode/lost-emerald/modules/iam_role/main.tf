resource "aws_iam_role" "this" {
  assume_role_policy   = jsonencode(var.assume_role_policy_document)
  max_session_duration = var.max_session_duration
  name                 = var.role_name
  path                 = var.role_path
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.attached_policies

  policy_arn = each.value.policy_arn
  role       = aws_iam_role.this.name
}