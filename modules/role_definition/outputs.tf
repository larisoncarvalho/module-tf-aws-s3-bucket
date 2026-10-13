output "id" {
  description = "The ID of the role definition"
  value       = azurerm_role_definition.this.id
}

output "role_definition_id" {
  description = "The UUID of the role definition"
  value       = azurerm_role_definition.this.role_definition_id
}
