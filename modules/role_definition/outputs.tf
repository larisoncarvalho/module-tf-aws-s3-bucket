output "id" {
  description = "The Terraform-specific ID of the role definition (format: {roleDefinitionId}|{scope})."
  value       = azurerm_role_definition.this.id
}

output "role_definition_id" {
  description = "The Role Definition ID."
  value       = azurerm_role_definition.this.role_definition_id
}

output "role_definition_resource_id" {
  description = "The Azure Resource Manager ID for the resource."
  value       = azurerm_role_definition.this.role_definition_resource_id
}