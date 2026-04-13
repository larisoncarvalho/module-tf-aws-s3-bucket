resource "aws_iam_role" "this" {
  assume_role_policy   = var.assume_role_policy
  max_session_duration = var.max_session_duration
  name                 = var.name
  path                 = var.path
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.attached_policy_arns

  policy_arn = each.value.arn
  role       = aws_iam_role.this.name
}