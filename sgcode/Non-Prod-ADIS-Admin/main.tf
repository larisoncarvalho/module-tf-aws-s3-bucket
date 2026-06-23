# Root module — wires the iam_role module for all IAM role instances

module "iam_role" {
  source   = "./modules/iam_role"
  for_each = var.iam_roles

  # Identity
  name = each.value.name
  path = each.value.path

  # Trust relationship
  assume_role_policy = each.value.assume_role_policy

  # Session settings
  max_session_duration = each.value.max_session_duration

  # Policies to attach
  attached_policy_arns = each.value.attached_policy_arns

  # Resource tags
  tags = each.value.tags
}
