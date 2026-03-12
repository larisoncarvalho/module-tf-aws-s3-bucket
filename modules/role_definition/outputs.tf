output "role_definition_id" {
  description = "The ID of the role definition"
  value       = azurerm_role_definition.this.id
}

output "role_definition_name" {
  description = "The name of the role definition"
  value       = azurerm_role_definition.this.name
}