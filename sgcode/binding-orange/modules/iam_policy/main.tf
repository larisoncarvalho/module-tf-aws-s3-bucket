resource "aws_iam_policy" "this" {
  name   = var.name
  path   = var.path
  policy = var.policy
}