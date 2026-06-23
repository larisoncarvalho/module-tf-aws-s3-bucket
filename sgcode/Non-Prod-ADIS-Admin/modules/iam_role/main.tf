# IAM Role — primary resource representing a single AWS IAM role
resource "aws_iam_role" "this" {
  name                 = var.name
  path                 = var.path
  assume_role_policy   = var.assume_role_policy
  max_session_duration = var.max_session_duration
  tags                 = var.tags
}

# IAM Role Policy Attachments — one attachment per managed policy ARN
resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.attached_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}
