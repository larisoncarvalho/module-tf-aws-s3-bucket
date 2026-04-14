module "iam_role" {
  source = "./modules/iam_role"

  assume_role_policy   = var.iam_role_assume_role_policy
  attached_policy_arns = var.iam_role_attached_policy_arns
  max_session_duration = var.iam_role_max_session_duration
  name                 = var.iam_role_name
  path                 = var.iam_role_path
  test = 23
}