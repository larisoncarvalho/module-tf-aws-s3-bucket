resource "google_project_iam_policy" "this" {
  project     = var.project
  policy_data = var.policy_data
}