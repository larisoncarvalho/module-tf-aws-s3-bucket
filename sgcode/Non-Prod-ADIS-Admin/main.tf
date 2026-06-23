# ROOT MODULE — WIRES THE IAM_ROLE MODULE FOR ALL IAM ROLE INSTANCES

module "iam_role" {
  source   = "./modules/iam_role"
  for_each = var.iam_roles

  # IDENTITY
  name = each.value.name
  path = each.value.path

  # TRUST RELATIONSHIP
  assume_role_policy = each.value.assume_role_policy

  # SESSION SETTINGS
  max_session_duration = each.value.max_session_duration

  # POLICIES TO ATTACH
  attached_policy_arns = each.value.attached_policy_arns

  # RESOURCE TAGS
  tags = each.value.tags
}