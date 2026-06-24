# Manages a single AWS IAM Role and its attached managed policy ARNs.

# Primary IAM role resource
resource "aws_iam_role" "this" {
  name                 = var.name
  path                 = var.path
  description          = var.description
  max_session_duration = var.max_session_duration
  assume_role_policy   = var.assume_role_policy
  tags                 = var.tags
}

# Attaches each managed policy ARN to the IAM role
resource "aws_iam_role_policy_attachment" "this" {
  for_each   = toset(var.attached_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}
