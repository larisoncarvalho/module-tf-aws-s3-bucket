resource "google_artifact_registry_repository" "this" {
  repository_id          = var.repository_id
  format                 = var.format
  location               = var.location
  mode                   = var.mode
  labels                 = var.labels
  cleanup_policy_dry_run = var.cleanup_policy_dry_run
}