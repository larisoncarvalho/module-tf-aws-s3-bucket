# Root module — wires the iam_role module for each discovered IAM role instance

module "iam_role" {
  source   = "./modules/iam_role"
  for_each = var.iam_roles

  name                 = each.value.name
  path                 = each.value.path
  description          = each.value.description
  max_session_duration = each.value.max_session_duration
  assume_role_policy   = each.value.assume_role_policy
  attached_policy_arns = each.value.attached_policy_arns
  tags                 = each.value.tags
}
