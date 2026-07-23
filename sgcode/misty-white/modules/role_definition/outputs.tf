output "id" {
  value       = azurerm_role_definition.this.id
  description = "The ID of the role definition"
}

output "role_definition_id" {
  value       = azurerm_role_definition.this.role_definition_id
  description = "The unique identifier for the role definition"
}

output "name" {
  value       = azurerm_role_definition.this.name
  description = "The name of the role definition"
}