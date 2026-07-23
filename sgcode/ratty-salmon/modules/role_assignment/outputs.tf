output "id" {
  description = "The ID of the role assignment"
  value       = azurerm_role_assignment.this.id
}

output "principal_id" {
  description = "The principal ID of the role assignment"
  value       = azurerm_role_assignment.this.principal_id
}