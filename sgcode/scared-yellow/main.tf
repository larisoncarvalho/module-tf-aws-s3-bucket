module "project_iam_policy" {
  source   = "./modules/project_iam_policy"
  project  = var.project
  bindings = var.bindings
}