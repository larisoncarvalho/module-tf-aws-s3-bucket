output "repository_id" {
  description = "The repository ID"
  value       = google_artifact_registry_repository.this.repository_id
}

output "name" {
  description = "The name of the repository"
  value       = google_artifact_registry_repository.this.name
}

output "registry_uri" {
  description = "The repository endpoint URI"
  value       = google_artifact_registry_repository.this.registry_uri
}