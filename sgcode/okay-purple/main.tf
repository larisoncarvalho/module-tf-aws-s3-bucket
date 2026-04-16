module "iam_role" {
  source               = "./modules/iam_role"
  name                 = var.name
  path                 = var.path
  description          = var.description
  assume_role_policy   = var.assume_role_policy
  max_session_duration = var.max_session_duration
  attached_policy_arns = var.attached_policy_arns
}