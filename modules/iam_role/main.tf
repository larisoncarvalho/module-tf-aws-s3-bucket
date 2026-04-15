resource "aws_iam_role" "this" {
  assume_role_policy   = jsonencode(var.assume_role_policy_document)
  description          = var.role_description
  max_session_duration = var.max_session_duration
  name                 = var.role_name
  path                 = var.role_path
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.attached_policy_arns

  policy_arn = each.value
  role       = aws_iam_role.this.name
}