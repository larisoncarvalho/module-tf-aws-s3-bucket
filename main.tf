module "iam_policy" {
  source = "./modules/iam_policy"

  name   = var.iam_policy_name
  path   = var.iam_policy_path
  policy = var.iam_policy_document
}