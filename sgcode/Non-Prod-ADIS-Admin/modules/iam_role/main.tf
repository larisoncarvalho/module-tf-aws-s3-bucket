# IAM ROLE — PRIMARY RESOURCE REPRESENTING A SINGLE AWS IAM ROLE
resource "aws_iam_role" "this" {
  name                 = var.name
  path                 = var.path
  assume_role_policy   = var.assume_role_policy
  max_session_duration = var.max_session_duration
  tags                 = var.tags
}

# IAM ROLE POLICY ATTACHMENTS — ONE ATTACHMENT PER MANAGED POLICY ARN
resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.attached_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}