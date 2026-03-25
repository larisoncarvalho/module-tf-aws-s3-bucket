module "iam_role" {
  for_each = var.roles

  source = "./modules/iam_role"

  name                        = each.value.name
  path                        = each.value.path
  assume_role_policy_document = each.value.assume_role_policy_document
  max_session_duration        = each.value.max_session_duration
  attached_policy_arns        = each.value.attached_policy_arns
}