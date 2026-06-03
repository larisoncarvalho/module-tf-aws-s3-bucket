output "role_definition_id" {
  description = "The Role Definition ID."
  value       = module.role_definition.role_definition_id
}

output "role_definition_resource_id" {
  description = "The Azure Resource Manager ID for the resource."
  value       = module.role_definition.role_definition_resource_id
}

output "id" {
  description = "The Terraform-specific ID of the role definition."
  value       = module.role_definition.id
}