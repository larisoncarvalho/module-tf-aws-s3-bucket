resource "google_project_organization_policy" "this" {
  project    = var.project
  constraint = var.constraint
}