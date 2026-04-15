resource "aws_iam_role" "this" {
  name                 = var.name
  path                 = var.path
  description          = var.description
  max_session_duration = var.max_session_duration
  assume_role_policy   = jsonencode(var.assume_role_policy_document)
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.attached_policy_arns

  role       = aws_iam_role.this.name
  policy_arn = each.value
}