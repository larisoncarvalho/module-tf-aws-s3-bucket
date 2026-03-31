module "iam_policies" {
  source = "./modules/iam_policy"

  policies = var.policies
}