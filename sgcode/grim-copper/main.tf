module "iam_policy" {
  source = "./modules/iam_policy"

  name   = var.name
  path   = var.path
  policy = var.policy
}