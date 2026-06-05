module "iam_role" {
  source   = "./modules/iam_role"
  for_each = var.iam_roles

  assume_role_policy    = each.value.assume_role_policy
  force_detach_policies = each.value.force_detach_policies
  inline_policy         = each.value.inline_policy
  managed_policy_arns   = each.value.managed_policy_arns
  max_session_duration  = each.value.max_session_duration
  name                  = each.value.name
  path                  = each.value.path
}