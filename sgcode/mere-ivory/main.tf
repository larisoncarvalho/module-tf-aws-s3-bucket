module "project_iam_policy" {
  source      = "./modules/project_iam_policy"
  project     = var.project
  policy_data = var.policy_data
}