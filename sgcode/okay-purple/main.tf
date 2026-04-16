module "iam_role" {
  source               = "./modules/iam_role"
  assume_role_policy   = var.assume_role_policy
  description          = var.description
  max_session_duration = var.max_session_duration
  name                 = var.name
  path                 = var.path
  policy_attachments   = var.policy_attachments
}