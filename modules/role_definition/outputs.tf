output "role_definition_id" {
  description = "The ID of the role definition"
  value       = azurerm_role_definition.this.id
}

output "role_definition_resource_id" {
  description = "The resource ID of the role definition"
  value       = azurerm_role_definition.this.role_definition_resource_id
}