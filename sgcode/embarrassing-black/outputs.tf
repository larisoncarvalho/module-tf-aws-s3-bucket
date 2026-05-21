output "repository_id" {
  description = "The repository ID"
  value       = module.artifact_registry_repository.repository_id
}

output "name" {
  description = "The name of the repository"
  value       = module.artifact_registry_repository.name
}

output "registry_uri" {
  description = "The repository endpoint URI"
  value       = module.artifact_registry_repository.registry_uri
}