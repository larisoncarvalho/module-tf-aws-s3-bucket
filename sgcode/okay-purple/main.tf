module "iam_role" {
  source               = "./modules/iam_role"
  name                 = var.iam_role_name
  path                 = var.iam_role_path
  description          = var.iam_role_description
  assume_role_policy   = var.iam_role_assume_role_policy
  max_session_duration = var.iam_role_max_session_duration
  attached_policy_arns = var.iam_role_attached_policy_arns
}