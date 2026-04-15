resource "aws_iam_policy" "this" {
  for_each = var.policies

  name   = each.value.name
  path   = each.value.path
  policy = jsonencode(each.value.policy)
}